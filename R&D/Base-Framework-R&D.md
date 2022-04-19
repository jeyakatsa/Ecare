# Base Framework Research & Development

## Contents:
- [Basic Smart-Contract Framework](#basic-smart-contract-framework)
- [Exchange Launching](#exchange-launching)

## Basic Smart-Contract Framework:

```solidity
pragma solidity ^0.4.0;
import "./ERC20.sol";
contract myToken is ERC20{
  mapping(address =&gt;uint256) public amount;
  uint256 totalAmount;
  string tokenName;
  string tokenSymbol;
  uint256 decimal;
    constructor() public{
      totalAmount = 10000 * 10**18;
      amount[msg.sender]=totalAmount;
      tokenName="Mytoken";
      tokenSymbol="Mytoken";
      decimal=18;
    }
  function totalSupply() public view returns(uint256){
      return totalAmount;
  }
  function balanceOf(address to_who) public view returns(uint256){
      return amount[to_who];
  }
  function transfer(address to_a,uint256 _value) public returns(bool){
      require(_value&lt;=amount[msg.sender]);
      amount[msg.sender]=amount[msg.sender]-_value;
      amount[to_a]=amount[to_a]+_value;
      return true;
  }
}
```
### Steps to test an Ethereum smart contract
1. Try to run all your smart contract methods like transfer, total supply, and balance(in the above smart contract example). These methods are present at the right-hand side of the remix window and you can run all the processes from there itself.
2. Try to transfer some tokens to other ethereum wallet addresses and then check the balance of that address by calling the balance method.
3. Try to get total supply by running the total supply method.

### Steps to deploy Ethereum Smart Contracts
1. To make your smart contract live, switch to the main ethereum network at metamask
2. Add some real ethers.
3. Now again, deploy your smart contract using remix as mentioned in the above steps.
4. When a smart contract is deployed successfully, visit http://www.etherscan.io and search your smart contract address there. Select your smart contract.
5. Now you need to verify your smart contract here, click “verify the contract.”
6. Copy your smart contract code and paste it at Etherscan. Select the same compiler version that you selected at remix to compile your code.
7. Check “optimization” to Yes, if you had selected optimization at remix; otherwise, select No.
8. Click Verify.
9. It will take a few minutes and your smart contract will be live if no issue occurs.
10. You can now run your smart contract methods at Etherscan.

### Tools and Technologies
#### Truffle
An Ethereum development framework that allows developers to write and test smart contracts. Written in JavaScript, Truffle contains a compiler for the Solidity programming language. Truffle Contract is a JavaScript library that allows importing of compiled smart contracts.
#### Web3.js
An Ethereum JavaScript API that interacts with the Ethereum network via RPC calls.
#### Visual Studio Code
A functional code editor.
#### Ganache CLI
An Ethereum remote procedure call client within the Truffle framework that is also known as TestRPC.
#### Parity
A secure and fast Ethereum client for handling Ethereum accounts and tokens.
#### Node.js
A javascript runtime environment used for server-side programming. Node.js is required to test the Ethereum smart contract’s functionality while ensuring its secure and proper operation. You need to install a package manager, for example, Yarn along with Node.js.

### Expanded Steps:

#### Total Supply
For the needs of our ECR20 tutorial, we shall use the simplest approach: Set the total amount of tokens at contract creation time and initially assign all of them to the “contract owner” i.e. the account that deployed the smart contract:

```solidity
uint256 totalSupply_;
constructor(uint256 total) public {
   totalSupply_ = total;
   balances[msg.sender] = _totalSupply;
}
```

A constructor is a special function automatically called by Ethereum right after the contract is deployed. It is typically used to initialize the token’s state using parameters passed by the contract’s deploying account.

msg is a global variable declared and populated by Ethereum itself. It contains important data for performing the contract. The field we are using here: msg.sender contains the Ethereum account executing the current contract function.

Only the deploying account can enter a contract’s constructor. When the contract is started up, this function allocates available tokens to the ‘contract owner’ account.

#### Get Total Token Supply
```solidity
function totalSupply() public view returns (uint256) {
  return totalSupply_;
}
```
This function will return the number of all tokens allocated by this contract regardless of owner.

#### Get Token Balance of Owner
```solidity
function balanceOf(address tokenOwner) public view returns (uint) {
  return balances[tokenOwner];
}
```

`balanceOf` will return the current token balance of an account, identified by its owner’s address.

#### Transfer Tokens to Another Account
```solidity
function transfer(address receiver,
                 uint numTokens) public returns (bool) {
  require(numTokens <= balances[msg.sender]);
  balances[msg.sender] = balances[msg.sender] — numTokens;
  balances[receiver] = balances[receiver] + numTokens;
  emit Transfer(msg.sender, receiver, numTokens);
  return true;
}
```
As its name suggests, the transfer function is used to move `numTokens` amount of tokens from the owner’s balance to that of another user, or receiver. The transferring owner is `msg.sender` i.e. the one executing the function, which implies that only the owner of the tokens can transfer them to others.

Solidity’s way of asserting a predicate is require. In this case that the transferring account has a sufficient balance to execute the transfer. If a require statement fails, the transaction is immediately rolled back with no changes written into the blockchain.

Right before exiting, the function fires ERC20 event Transfer allowing registered listeners to react to its completion.

#### Approve Delegate to Withdraw Tokens
This function is most often used in a token marketplace scenario.

```solidity
function approve(address delegate,
                uint numTokens) public returns (bool) {
  allowed[msg.sender][delegate] = numTokens;
  emit Approval(msg.sender, delegate, numTokens);
  return true;
}
```

What approve does is to allow an owner i.e. msg.sender to approve a delegate account — possibly the marketplace itself — to withdraw tokens from his account and to transfer them to other accounts.

As you can see, this function is used for scenarios where owners are offering tokens on a marketplace. It allows the marketplace to finalize the transaction without waiting for prior approval.

At the end of its execution, this function fires an Approval event.

#### Get Number of Tokens Approved for Withdrawal

```solidity
function allowance(address owner,
                  address delegate) public view returns (uint) {
  return allowed[owner][delegate];
}
```

This function returns the current approved number of tokens by an owner to a specific delegate, as set in the approve function.

#### Transfer Tokens by Delegate

The transferFrom function is the peer of the approve function, which we discussed previously. It allows a delegate approved for withdrawal to transfer owner funds to a third-party account.

```solidity
function transferFrom(address owner, address buyer,
                     uint numTokens) public returns (bool) {
  require(numTokens <= balances[owner]);
  require(numTokens <= allowed[owner][msg.sender]);
  balances[owner] = balances[owner] — numTokens;
  allowed[owner][msg.sender] =
        allowed[from][msg.sender] — numTokens;
  balances[buyer] = balances[buyer] + numTokens;
  Transfer(owner, buyer, numTokens);
  return true;
}
```

The two require statements at function start are to verify that the transaction is legitimate, i.e. that the owner has enough tokens to transfer and that the delegate has approval for (at least) numTokens to withdraw.

In addition to transferring the numTokens amount from owner to buyer, this function also subtracts numTokens from the delegate’s allowance. This basically allows a delegate with a given allowance to break it into several separate withdrawals, which is typical marketplace behavior.

We could stop here and have a valid ERC20 implementation. However, we want to go a step further, as we want an industrial strength token. This requires us to make our code a bit more secure, though we will still be able to keep the token relatively simple, if not basic.

#### SafeMath Solidity Library

SafeMath is a Solidity library aimed at dealing with one way hackers have been known to break contracts: integer overflow attack. In such an attack, the hacker forces the contract to use incorrect numeric values by passing parameters that will take the relevant integers past their maximal values.

SafeMath protects against this by testing for overflow before performing the arithmetic action, thus removing the danger of overflow attack. The library is so small that the impact on contract size is minimal, incurring no performance and little storage cost penalties.

```solidity
library SafeMath { // Only relevant functions
function sub(uint256 a, uint256 b) internal pure returns (uint256) {
  assert(b <= a);
  return a — b;
}
function add(uint256 a, uint256 b) internal pure returns (uint256)   {
  uint256 c = a + b;
  assert(c >= a);
  return c;
}
}
```

SafeMath uses `assert` statements to verify the correctness of the passed parameters. Should assert fail, the function execution will be immediately stopped and all blockchain changes shall be rolled back.

Next, let us add the following statement introducing the library to the Solidity compiler:

```solidity
using SafeMath for uint256;
```

Then, we replace the naive arithmetics we used at the beginning with SafeMath functions:

```solidity
balances[msg.sender] = balances[msg.sender].sub(numTokens);
balances[receiver] = balances[receiver].add(numTokens);
balances[buyer] = balances[buyer].add(numTokens);
balances[owner] = balances[owner].sub(numTokens);
```

##### PACKING IT ALL TOGETHER
In Solidity, a smart contract’s functions and events are wrapped into an entity called a contract which you can silently translate to a “blockchain class.” Below is the ERC20-compatible contract we created, including a Gist of our code. The name and symbol fields can be changed at will. Most tokens keep the decimal value at 18, so we will do the same.

#### Contract creation
The first and most important part of deploying a smart contract is the actual creation of the contract. According to the Ethereum yellow paper, the base cost of a create operation is a whopping 32,000 gas, and added to that is the base cost of 21,000 gas for entering a new transaction onto the block itself. This alone puts the creation price at 53,000 gas.

Given that: `3,000 Gas * 0.0000001 Ether per Gas * $4000 per Ether = $21.20`

That is $21 for the deployment of the contract itself. This is far from the final cost, as we will see, but this is still a sizeable cost for simply initializing a blank contract.

For larger applications such as a platform like a pancake swap, their application is not a single contract but a collection of contracts all talking and working together. There will be multiple deployments, each of which needs to pay this fee. That is $21 per empty contract. See their open-source repo here:

#### Contract storage
Contracts also need to be stored somewhere. Ethereum has a cost for storage according to the whitepaper of 20,000 gas per 256 bits. A kilobyte of data adds up to a whopping 640,000 gas or just over $250 dollars.

So how big is our contract in this example? We can gauge this by checking similar sizes of other contracts.

Using Ether-scan (a site to explore the state of the chain) to find a few example contracts like so:
https://etherscan.io/tx/0xeed6c791744af81bde027c6bcb2ac927b6d7964535edfc434c060fec7d24de2b
https://etherscan.io/tx/0x28c44bb10d469cbd42accf97bd00b73eabbace138e9d44593e851231fbed1cb7

We can see that these contracts are running about 8KB in length. These are large and popular examples, so our simple example can be smaller, but it’s good to know they exist.
If we were asking for 8KB to store our bytecode at 640,000 gas per KB, we get a price of over $2000!

`8 KB * 640000 Gas Each * 0.0000001 Ether * $4000 = $2048`

That is one expensive contract! The ones I cited there were deployed on particularly high gas-cost days, with one of them guzzling 6 million gas at 300 Gwei each. Not a cheap operation at all.

#### Contract execution
Now that we have committed to deploying the contract and have paid the cost to store it, it’s finally time to run it! The last step for Ethereum is to run the initialization function of the contract. This is a block of code that is written to allocate and variables or do whatever else you want on deployment.
This is the most variable of all the costs as depending on what you want to do here, it could be free, or it could be the largest price by far. 

Allocation of memory for a contract costs 200 Gwei per byte, which is expensive, to say the least. If your application was memory-hungry and wanted to take up a single gigabyte for internal storage it would cost over 80 MILLION DOLLARS:

`1 Billion Bytes * 200 Gas* 0.0000001 Ether * $4000 = $80,000,000`

Choose to be more conservative with memory and take a few kilobytes of data for internal states and user data. What would this cost? $1600.

`20,000 Bytes * 200 Gas Each * 0.0000001 Ether per Gwei * 4000 Dolars`4

#### In Closing
Simply put, Ethereum’s main chain is suffering from multiple compounding issues at once.
1. Ether is surging in price, meaning everything is more expensive when converted to USD.
2. The network has a limited bandwidth, with limited space, this is increasingly causing bidding wars for space on blocks.
3. The network is hitting major network effects. As everyone floods onto the platform, the value of the platform rises, and thus people are willing to pay more and more to join the party.

At the end of the day, deployment to the Ethereum main chain is likely a bad idea for most projects. If you are looking for alternatives, there are many layer-2-chains that boast much lower prices and many of the benefits Ethereum brings.

## Exchange Launching

### Uniswap
Contrary to the traditional architecture of the “order book” model which many crypto exchange platforms use, Uniswap works with the help of the following two components:

- Liquidity Pools
- Constant Product Market Maker Protocol

### Liquidity Pools
Simply defined, liquidity pools refer to token pools locked in smart contracts. They provide liquidity to facilitate trading. Several decentralized exchange platforms use liquidity pools.

### Constant Product Market Maker Protocol
The constant product market maker protocol is a form of the much known automated market maker (AMM) model. Basically, automated market makers are smart contracts that hold liquidity pools. These pools are funded by liquidity providers so that the traders can trade against these pools. Traders pay a fee to the pool in return, which is proportionally divided among the liquidity providers, according to their shares. The constant product market maker protocol works similarly, along with the advantage that any token can be added to Uniswap if it is funded with an equal value of ETH or ERC20 token being traded.

So how does it work?

Liquidity Providers, also known as LPs, form a market by depositing two tokens of equivalent value, which can either be an ETH and an ERC-20 token or two ERC20 tokens. Mostly, these pools are made of stablecoins like DAI. Liquidity providers get liquidity tokens in return, which:

- depict their share in the liquidity pool
- can be redeemed for the share they represent.

The main idea behind Uniswap is that the total liquidity in the liquidity pool must remain constant. Let’s understand this with the help of an example.

The liquidity pool we’ll take into consideration is the ETH/USDT liquidity pool. Let’s refer to the ETH portion as x and the USDT portion as y. To calculate the pool’s total liquidity (which we will consider as k), Uniswap multiplies these two quantities: **x x y = k**

So, if you buy 1 ETH for 300 USDT via the ETH/USDT liquidity pool, you increase the USDT portion and reduce the ETH portion of the pool. This implies that the price of ETH will rise because k must remain constant, so the price of ETH is based on how much shift the given transaction/trade causes between x and y. This is the mechanism that determines the pricing. Hence, it is conceivable that with large liquidity pools, it is easier to process large trades as the shift between x and y is lower as compared to smaller liquidity pools.

This mechanism brings us to the concept of impermanent losses. 

### Impermanent Losses
Liquidity providers earn a fee in exchange for providing liquidity for traders to swap tokens. But often, liquidity providers don’t take every aspect into account while providing liquidity to the pools. One such aspect is impermanent losses, which you’ll understand better with the help of an example.

Suppose there is a pool on Uniswap with 10 ETH and 1,000 USDT, and you deposit 1 ETH and 100 USDT in it. Token pairs have to be of equal value, which implies:

**Price of 1 ETH = 100 USDT**

This implies that you have a 10% share of the pool. The total liquidity here will be 10,000. If a few trades take place and cause a shift in the ratio of USDT and ETH to 2,000 and 5 respectively, the price of 1 ETH will rise to 400 USDT. Why? The reason behind this is precisely what we discussed earlier, i.e., the total liquidity must be constant. So, the arbitrage traders will remove ETH and add USDT to the pool until the ratio stabilizes.

At this price, according to your 10% share, you own 0.5 ETH and 200 USDT (total 400 USDT), which is lesser than what you had deposited (total 500 USDT at this price). The loss here is “impermanent” because as long as you don’t withdraw your funds from the pool, this loss can be recovered or balanced:

- when the price of ETH returns to its original value, i.e., 100 USDT.
- by earning LP fees over time.

However, if you withdraw your funds at this time, then your loss will become permanent as you’ll only receive a total value of 400 USDT.

### Create an Exchange
The first thing you need to do is create an exchange so that Uniswap knows about your token. You may take the following steps to create an exchange:

Step 1: Go to https://uniswap.exchange/ This screen will appear.

Listing Tokens on Uniswap ExchangeStep 2: Connect with your MetaMask Wallet.

Uniswap Exchange - Connect with your MetaMask WalletAs you can see, it will give a few other options to connect a wallet and ask you to download MetaMask if you haven’t done it already.

Step 3: Select the “Pool” option on the upper right corner of the screen.

Step 4: Select “Create Exchange”

Step 5: Press the “Select a Token”option.

Step 6: Enter your token’s address in the “Search Name or Address” field. Now select your token from the dropdown.

Step 7: Click on the “Create Exchange”option.

Step 8: A pop-up will show up. Click on the “Confirm” option.

#### More Info:
- https://www.toptal.com/ethereum/create-erc20-token-tutorial
- https://blog.logrocket.com/create-deploy-erc-20-token-ethereum-blockchain/
- https://medium.com/the-capital/how-much-does-it-cost-to-deploy-a-smart-contract-on-ethereum-11bcd64da1
- https://medium.com/the-capital/how-much-does-it-cost-to-deploy-a-smart-contract-on-ethereum-11bcd64da1

