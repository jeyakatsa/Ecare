## Base Framework Research & Development

### Basic Smart-Contract Framework:

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

#### More Info:
- https://www.toptal.com/ethereum/create-erc20-token-tutorial
- https://blog.logrocket.com/create-deploy-erc-20-token-ethereum-blockchain/

