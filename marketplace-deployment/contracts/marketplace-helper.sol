// SPDX-License-Identifier: MIT LICENSE

pragma solidity 0.8.7;
struct List {
    uint256 tokenId;
    address payable seller;
    address payable holder;
    address contractAddress;
    uint256 price;
    bool sold;
}
