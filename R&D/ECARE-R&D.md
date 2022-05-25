# ECARE Research & Development

## AMM Basics:

Contrary to the traditional architecture of the “order book” model which many crypto exchange platforms use, Uniswap works with the help of the following two components:

- Liquidity Pools
- Constant Product Market Maker Protocol

#### Liquidity Pools
Simply defined, liquidity pools refer to token pools locked in smart contracts. They provide liquidity to facilitate trading. Several decentralized exchange platforms use liquidity pools.

#### Constant Product Market Maker Protocol
The constant product market maker protocol is a form of the much known automated market maker (AMM) model. Basically, automated market makers are smart contracts that hold liquidity pools. These pools are funded by liquidity providers so that the traders can trade against these pools. Traders pay a fee to the pool in return, which is proportionally divided among the liquidity providers, according to their shares. The constant product market maker protocol works similarly, along with the advantage that any token can be added to Uniswap if it is funded with an equal value of ETH or ERC20 token being traded.

So how does it work?

Liquidity Providers, also known as LPs, form a market by depositing two tokens of equivalent value, which can either be an ETH and an ERC-20 token or two ERC20 tokens. Mostly, these pools are made of stablecoins like DAI. Liquidity providers get liquidity tokens in return, which:

- depict their share in the liquidity pool
- can be redeemed for the share they represent.

The main idea behind Uniswap is that the total liquidity in the liquidity pool must remain constant. Let’s understand this with the help of an example.

The liquidity pool we’ll take into consideration is the ETH/USDT liquidity pool. Let’s refer to the ETH portion as x and the USDT portion as y. To calculate the pool’s total liquidity (which we will consider as k), Uniswap multiplies these two quantities: **x x y = k**

So, if you buy 1 ETH for 300 USDT via the ETH/USDT liquidity pool, you increase the USDT portion and reduce the ETH portion of the pool. This implies that the price of ETH will rise because k must remain constant, so the price of ETH is based on how much shift the given transaction/trade causes between x and y. This is the mechanism that determines the pricing. Hence, it is conceivable that with large liquidity pools, it is easier to process large trades as the shift between x and y is lower as compared to smaller liquidity pools.

This mechanism brings us to the concept of impermanent losses. 

#### Impermanent Losses
Liquidity providers earn a fee in exchange for providing liquidity for traders to swap tokens. But often, liquidity providers don’t take every aspect into account while providing liquidity to the pools. One such aspect is impermanent losses, which you’ll understand better with the help of an example.

Suppose there is a pool on Uniswap with 10 ETH and 1,000 USDT, and you deposit 1 ETH and 100 USDT in it. Token pairs have to be of equal value, which implies:

**Price of 1 ETH = 100 USDT**

This implies that you have a 10% share of the pool. The total liquidity here will be 10,000. If a few trades take place and cause a shift in the ratio of USDT and ETH to 2,000 and 5 respectively, the price of 1 ETH will rise to 400 USDT. Why? The reason behind this is precisely what we discussed earlier, i.e., the total liquidity must be constant. So, the arbitrage traders will remove ETH and add USDT to the pool until the ratio stabilizes.

At this price, according to your 10% share, you own 0.5 ETH and 200 USDT (total 400 USDT), which is lesser than what you had deposited (total 500 USDT at this price). The loss here is “impermanent” because as long as you don’t withdraw your funds from the pool, this loss can be recovered or balanced:

- when the price of ETH returns to its original value, i.e., 100 USDT.
- by earning LP fees over time.

However, if you withdraw your funds at this time, then your loss will become permanent as you’ll only receive a total value of 400 USDT.

## AMM Creation

Most known AMM's uses p * q = k, where p is the amount of one token in the liquidity pool, and q is the amount of the other. Here “k” is a fixed constant which means the pool’s total liquidity always has to remain the same. For further explanation let us take an example if an AMM has coin A and Coin B, two volatile assets, every time A is bought, the price of A goes up as there is less A in the pool than before the purchase. Conversely, the price of B goes down as there is more B in the pool. The pool stays in constant balance, where the total value of A in the pool will always equal the total value of B in the pool. The size will expand only when new liquidity providers join the pool.

#### Implementing the smart contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract AMM {
    using SafeMath for uint256;
}
```

##### State Variables

Next, we define the state variables needed to operate the AMM. We will be using the same mathematical formula as used by Uniswap to determine the price of the assets (K = totalToken1 * totalToken2). For simplicity purposes, We are maintaining our own internal balance mapping (token1Balance & token2Balance) instead of dealing with the ERC-20 tokens. As Solidity doesn't support floating-point numbers, we will reserve the first six digits of an integer value to represent the decimal value after the dot. This is achieved by scaling the numbers by a factor of 10^6 (PRECISION).

```solidity
uint256 totalShares;  // Stores the total amount of share issued for the pool
uint256 totalToken1;  // Stores the amount of Token1 locked in the pool
uint256 totalToken2;  // Stores the amount of Token2 locked in the pool
uint256 K;            // Algorithmic constant used to determine price (K = totalToken1 * totalToken2)

uint256 constant PRECISION = 1_000_000;  // Precision of 6 decimal places

mapping(address => uint256) shares;  // Stores the share holding of each provider

mapping(address => uint256) token1Balance;  // Stores the available balance of user outside of the AMM
mapping(address => uint256) token2Balance;
```

##### Modifiers

Now we will define modifiers that will be used to check the validity of the parameters passed to the functions and restrict certain activities when the pool is empty.

```solidity
// Ensures that the _qty is non-zero and the user has enough balance
modifier validAmountCheck(mapping(address => uint256) storage _balance, uint256 _qty) {
    require(_qty > 0, "Amount cannot be zero!");
    require(_qty <= _balance[msg.sender], "Insufficient amount");
    _;
}

// Restricts withdraw, swap feature till liquidity is added to the pool
modifier activePool() {
    require(totalShares > 0, "Zero Liquidity");
    _;
}
```

The following functions are used to get the present state of the smart contract

```solidity
// Returns the balance of the user
function getMyHoldings() external view returns(uint256 amountToken1, uint256 amountToken2, uint256 myShare) {
    amountToken1 = token1Balance[msg.sender];
    amountToken2 = token2Balance[msg.sender];
    myShare = shares[msg.sender];
}

// Returns the total amount of tokens locked in the pool and the total shares issued corresponding to it
function getPoolDetails() external view returns(uint256, uint256, uint256) {
    return (totalToken1, totalToken2, totalShares);
}
```

As we are not using the ERC-20 tokens and instead, maintaining a record of the balance ourselves; we need a way to allocate tokens to the new users so that they can interact with the dApp. Users can call the faucet function to get some tokens to play with!

```solidity
// Sends free token(s) to the invoker
function faucet(uint256 _amountToken1, uint256 _amountToken2) external {
    token1Balance[msg.sender] = token1Balance[msg.sender].add(_amountToken1);
    token2Balance[msg.sender] = token2Balance[msg.sender].add(_amountToken2);
}
```

#### Provide
`provide` function takes two parameters - amount of token1 & amount of token2 that the user wants to lock in the pool. If the pool is initially empty then the equivalence rate is set as _amountToken1 : _amountToken2 and the user is issued 100 shares for it. Otherwise, it is checked whether the two amounts provided by the user have equivalent value or not. This is done by checking if the two amounts are in equal proportion to the total number of their respective token locked in the pool i.e. _amountToken1 : totalToken1 :: _amountToken2 : totalToken2 should hold.

```solidity
// Adding new liquidity in the pool
// Returns the amount of share issued for locking given assets
function provide(uint256 _amountToken1, uint256 _amountToken2) external validAmountCheck(token1Balance, _amountToken1) validAmountCheck(token2Balance, _amountToken2) returns(uint256 share) {
    if(totalShares == 0) { // Genesis liquidity is issued 100 Shares
        share = 100*PRECISION;
    } else{
        uint256 share1 = totalShares.mul(_amountToken1).div(totalToken1);
        uint256 share2 = totalShares.mul(_amountToken2).div(totalToken2);
        require(share1 == share2, "Equivalent value of tokens not provided...");
        share = share1;
    }

    require(share > 0, "Asset value less than threshold for contribution!");
    token1Balance[msg.sender] -= _amountToken1;
    token2Balance[msg.sender] -= _amountToken2;

    totalToken1 += _amountToken1;
    totalToken2 += _amountToken2;
    K = totalToken1.mul(totalToken2);

    totalShares += share;
    shares[msg.sender] += share;
}
```

Carefully notice the order of balance update we are performing in the above function. We are first deducting the tokens from the users' account and in the very last step, we are updating her share balance. This is done to prevent a reentrancy attack.

The given functions help the user get an estimate of the amount of the second token that they need to lock for the given token amount. Here again, we use the proportion _amountToken1 : totalToken1 :: _amountToken2 : totalToken2 to determine the amount of token1 required if we wish to lock given amount of token2 and vice-versa.

```solidity
// Returns amount of Token1 required when providing liquidity with _amountToken2 quantity of Token2
function getEquivalentToken1Estimate(uint256 _amountToken2) public view activePool returns(uint256 reqToken1) {
    reqToken1 = totalToken1.mul(_amountToken2).div(totalToken2);
}

// Returns amount of Token2 required when providing liquidity with _amountToken1 quantity of Token1
function getEquivalentToken2Estimate(uint256 _amountToken1) public view activePool returns(uint256 reqToken2) {
    reqToken2 = totalToken2.mul(_amountToken1).div(totalToken1);
}
```

#### Withdraw
Withdraw is used when a user wishes to burn a given amount of share to get back their tokens. Token1 and Token2 are released from the pool in proportion to the share burned with respect to total shares issued i.e. **share : totalShare :: amountTokenX : totalTokenX.**

```
// Returns the estimate of Token1 & Token2 that will be released on burning given _share
function getWithdrawEstimate(uint256 _share) public view activePool returns(uint256 amountToken1, uint256 amountToken2) {
    require(_share <= totalShares, "Share should be less than totalShare");
    amountToken1 = _share.mul(totalToken1).div(totalShares);
    amountToken2 = _share.mul(totalToken2).div(totalShares);
}

// Removes liquidity from the pool and releases corresponding Token1 & Token2 to the withdrawer
function withdraw(uint256 _share) external activePool validAmountCheck(shares, _share) returns(uint256 amountToken1, uint256 amountToken2) {
    (amountToken1, amountToken2) = getWithdrawEstimate(_share);
    
    shares[msg.sender] -= _share;
    totalShares -= _share;

    totalToken1 -= amountToken1;
    totalToken2 -= amountToken2;
    K = totalToken1.mul(totalToken2);

    token1Balance[msg.sender] += amountToken1;
    token2Balance[msg.sender] += amountToken2;
}
```
#### Swap

To swap from Token1 to Token2 we will implement three functions - `getSwapToken1Estimate`, `getSwapToken1EstimateGivenToken2` & `swapToken1`. The first two functions only determine the values of swap for estimation purposes while the last one does the conversion.

`getSwapToken1Estimate` returns the amount of token2 that the user will get when depositing a given amount of token1. The amount of token2 is obtained from the equation **K = totalToken1 * totalToken2** where the K should remain the same before/after the operation. This gives us **K = (totalToken1 + amountToken1) * (totalToken2 - amountToken2)** and we get the value `amountToken2` from solving this equation. In the last line, we are ensuring that the pool is never drained completely from either side, which would make the equation undefined.

```solidity
// Returns the amount of Token2 that the user will get when swapping a given amount of Token1 for Token2
function getSwapToken1Estimate(uint256 _amountToken1) public view activePool returns(uint256 amountToken2) {
    uint256 token1After = totalToken1.add(_amountToken1);
    uint256 token2After = K.div(token1After);
    amountToken2 = totalToken2.sub(token2After);

    // To ensure that Token2's pool is not completely depleted leading to inf:0 ratio
    if(amountToken2 == totalToken2) amountToken2--;
}
```

`getSwapToken1EstimateGivenToken2` returns the amount of token1 that the user should deposit to get a given amount of token2. Amount of token1 is similarly obtained by solving the following equation **K = (totalToken1 + amountToken1) * (totalToken2 - amountToken2).**

```solidity
// Returns the amount of Token1 that the user should swap to get _amountToken2 in return
function getSwapToken1EstimateGivenToken2(uint256 _amountToken2) public view activePool returns(uint256 amountToken1) {
    require(_amountToken2 < totalToken2, "Insufficient pool balance");
    uint256 token2After = totalToken2.sub(_amountToken2);
    uint256 token1After = K.div(token2After);
    amountToken1 = token1After.sub(totalToken1);
```

`getSwapToken1EstimateGivenToken2` returns the amount of token1 that the user should deposit to get a given amount of token2. Amount of token1 is similarly obtained by solving the following equation **K = (totalToken1 + amountToken1) * (totalToken2 - amountToken2).**

```solidity
// Returns the amount of Token1 that the user should swap to get _amountToken2 in return
function getSwapToken1EstimateGivenToken2(uint256 _amountToken2) public view activePool returns(uint256 amountToken1) {
    require(_amountToken2 < totalToken2, "Insufficient pool balance");
    uint256 token2After = totalToken2.sub(_amountToken2);
    uint256 token1After = K.div(token2After);
    amountToken1 = token1After.sub(totalToken1);
}
```

--------------------------------------------------------------

### Uniswap Point of Reference:

#### Create an Exchange
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

#### Add Liquidity
Now that you have created an exchange for your tokens, it is time to add liquidity. You will have to deposit both ETH and your own token. The price will be set according to how many tokens you deposit. Why? Because, as we discussed earlier, the tokens are supposed to be deposited in pairs and should be of equal value, as the total liquidity of the pool must remain constant. Hence, if you deposit 1 ETH with 1 of your token, then it would imply that your token price will be equal to 1 ETH.

Step 1:Click on the dropdown on the same page and press “Add Liquidity.”

Step 2: Put in the amount of ETH you wish to deposit.

Step 3: Now select the “Select a Token” option.

Step 4: Enter your token’s address in the “Token Address” field and select your token from the dropdown.

Step 5: Press the “Unlock” option. You’ll find it next to your token symbol.

Step 6: Click on “Confirm” once the pop-up shows up. Your transaction will be confirmed.

Step 7: Now, in the same way, enter the amount of your tokens you wish to deposit. Make sure to check the calculated exchange rate.

Step 8: Now, select the “Add Liquidity” option and click “Confirm” once the pop-up shows up.

#### Remove Liquidity
Suppose you sell your tokens to investors and wish to remove your liquidity/deposits from the platform. You may follow the following steps to do so:

Step 1: Go to https://uniswap.exchange/remove-liquidity.

Step 2:Press the “Select a Token” option.

Step 3: Put in your token’s address in the “Token Address”field.

Step 4:Choose your token from the dropdown.

Step 5: Uniswap will provide you with your pool’s balance. Enter the amount you wish to withdraw.

Step 6: Uniswap will show you the funds you’ll receive for both ETH and your token. Press the “Remove Liquidity” option.

Step 7: Select the “Confirm” option when the MetaMask pop-up shows up.
To show the tokens in Metamask go to Assets then Add Token then paste the contract address in.
