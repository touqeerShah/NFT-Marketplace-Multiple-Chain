// SPDX-License-Identifier: MIT LICENSE

pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./marketplace-helper.sol";

contract NFTMarketResell is IERC721Receiver, ReentrancyGuard, Ownable {
    // Type Declarations
    using Counters for Counters.Counter;
    // State variables
    ERC721Enumerable nft;
    Counters.Counter private _itemCounter;
    Counters.Counter private _itemSoldCounter;

    address payable immutable i_holder;
    uint256 private s_istingFee = 0.0025 ether;
    // here we take address of contract which were we want to list and token ID
    mapping(address => mapping(uint256 => List)) public s_vaultItems;

    event NFTListCreated(
        uint256 indexed tokenId,
        address seller,
        address holder,
        uint256 price,
        bool sold
    );

    constructor(ERC721Enumerable _nft) {
        i_holder = payable(msg.sender);
        nft = _nft;
    }

    function listSale(
        uint256 tokenId,
        uint256 price,
        address contractAddress
    ) public payable nonReentrant {
        require(nft.ownerOf(tokenId) == msg.sender, "NFT not yours");
        require(s_vaultItems[contractAddress][tokenId].tokenId == 0, "NFT already listed");
        require(price > 0, "Amount must be higher than 0");
        require(msg.value == s_istingFee, "Please transfer 0.0025 crypto to pay listing fee");
        // s_vaultItems[tokenId] = List(
        //     tokenId,
        //     payable(msg.sender),
        //     payable(address(this)),
        //     price,
        //     false
        // );
        nft.transferFrom(msg.sender, address(this), tokenId);
        emit NFTListCreated(tokenId, msg.sender, address(this), price, false);
    }

    function buyNft(uint256 tokenId) public payable nonReentrant {
        uint256 price = s_vaultItems[tokenId].price;
        require(msg.value == price, "Transfer Total Amount to complete transaction");
        s_vaultItems[tokenId].seller.transfer(msg.value);
        nft.transferFrom(address(this), msg.sender, tokenId);
        s_vaultItems[tokenId].sold = true;
        delete s_vaultItems[tokenId];
    }

    function cancelSale(uint256 tokenId) public nonReentrant {
        require(s_vaultItems[tokenId].seller == msg.sender, "NFT not yours");
        nft.transferFrom(address(this), msg.sender, tokenId);
        delete s_vaultItems[tokenId];
    }

    function getPrice(uint256 tokenId) public view returns (uint256) {
        uint256 price = s_vaultItems[tokenId].price;
        return price;
    }

    function nftListings(address contractAddress) public view returns (List[] memory) {
        uint256 nftCount = nft.totalSupply();
        uint256 currentIndex = 0;
        List[] memory items = new List[](nftCount);
        for (uint256 i = 0; i < nftCount; i++) {
            if (s_vaultItems[contractAddress][i + 1].holder == address(this)) {
                uint256 currentId = i + 1;
                List storage currentItem = s_vaultItems[contractAddress][currentId];
                items[currentIndex] = currentItem;
                currentIndex += 1;
            }
        }
        return items;
    }

    function setListingFee(uint256 _listingFee) public onlyOwner {
        s_istingFee = _listingFee;
    }

    function getListingFee() public view returns (uint256) {
        return s_istingFee;
    }

    function onERC721Received(
        address,
        address from,
        uint256,
        bytes calldata
    ) external pure override returns (bytes4) {
        require(from == address(0x0), "Cannot send nfts to Vault directly");
        return IERC721Receiver.onERC721Received.selector;
    }

    function withdraw() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));
    }
}
