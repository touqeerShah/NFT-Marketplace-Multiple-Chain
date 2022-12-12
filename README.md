# NFT Marketplace

This project is for buy and resale the NFT on Multiple Chain Support

## Tool

1. Hardhet for contract development
2. NextJS for Frontend
3. web3 and etherjs

### Step 1

1. Create nextJs Project

```
## https://nextjs.org/docs
yarn create next-app
```

2. Create hardhat project

```
mkdir marketplace-deployment
cd marketplace-deployment
yarn  init
yarn  add hardhat
yarn hardhat
```

3. Start hardhat Node and connect with your metamask

```
hardhat node
```

4. To write and test our conttract we will used Remix because it fester way to comppile and more helpful to intract with contract and used injected matemask so we can use our own hardat node which we run local so we can look at the logs and debug things

### Step 2

It's to time to develop smart contract we are going two contract.

1. ERC712 Contract where user want to mint NFT, Transfer, Approve and other ERC712 Stander Token
2. Marketplace Contract where user can list NFT token for sale, buy, cancel nft and withdraw amount.

- > we have marketplace helper contract where we define event, error, stucut  
  > for markeplace

```
yarn add @openzeppelin/contracts
```

### step 3

Start working with frontend need few dependencty install

```
https://nextui.org/
yarn add axios @nextui-org/react sf-font
yarn add simple-crypto-js # encryption and decryton
yarn add web3modal ## connect to wallet

yarn add @metamask/detect-provider ## this help as to detected on which blockchain provider user wallet is connected lik polygon,ethereum,binanx
yarn add ipfs-http-client ## allow user to connect with ipfs cluster to upload files
yarn add web3
yarn add canvas-confetti
https://www.npmjs.com/package/simple-crypto-js
```

#### \_app

1. first import required libraries for sytling
