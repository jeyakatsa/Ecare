<img src="https://github.com/jeyakatsa/monalisa/blob/main/assets/EcareIcon.png" width="60px">

# [ECARE](https://ecare.exchange)
## Ethereum Combinatorial Auction Rate Exchange

#### ECARE (previously known as MonaLisa) is an Ethereum Combinatorial Auction Rate Exchange meant to facilitate a self-sustaining exchange rate ecosystem immune to bear-markets. 

### Motivation:

Bear markets are insufficient for public goods operating under Ethereum since ERC-20 tokens in their current forms are mostly used as investment contracts needing consistent investment to maintain their values.

ECARE tokens *(ERC-20 tokens using ECARE)* are not to be "bought and sold" but rather, only exchanged or "swapped" via AMMs (Automated Market Makers like Uniswap or an ECARE AMM). 

*Thus, ECARE token balances rise and maintain value based on exchange rates agreed upon further calcifying a self-sustaining token ecosystem absent of consistent investment.*

### Mechanics:

Unlike other exchange rate systems, ECARE's system isn't based on the market caps of the tokens, but is based solely on wallet balances and tokens. Thus the mechanics that helps it remain immune from bear-markets, are the values from lesser valued wallets negated during exchanges. 

**Scenario 1:** *Wallet 1 exchanges 1 of their Tokens for 1 Token from Wallet 2.*

> ***Before Exchange***
> 
> | Wallet 1                      | Wallet 2                      |
> | ----------------------------- | ----------------------------- |
> | Balance = 2,000 USD           | Balance = 1,000 USD           |
> | Tokens = 1,000                | Tokens = 1,000                |
> | 1 Token = 2 USD               | 1 Token = 1 USD               |
> 
> ***After Exchange***
> 
> | Wallet 1                      | Wallet 2                      |
> | ----------------------------  | ----------------------------- |
> | Balance = 2,000 USD           | Balance = 1,002 USD           |
> | Tokens = 1,000                | Tokens = 1,000                |
> | 1 Token = 2 USD               | 1 Token = 1.002 USD           |

**Scenario 2:** *Wallet 1 exchanges 50 of their Tokens for 1 Token from Wallet 2.*

> ***Before Exchange***
> 
> | Wallet 1                      | Wallet 2                      |
> | ----------------------------- | ----------------------------- |
> | Balance = 2,000 USD           | Balance = 1,000 USD           |
> | Tokens = 1,000                | Tokens = 1,000                |
> | 1 Token = 2 USD               | 1 Token = 1 USD               |
> 
> ***After Exchange***
> 
> | Wallet 1                      | Wallet 2                       |
> | ----------------------------- | ------------------------------ |
> | Balance = 2,000 USD           | Balance = 1,099 USD            |
> | Tokens = 951                  | Tokens = 1,049                 |
> | 1 Token = 2.103 USD           | 1 Token = 1.048 USD            |

------------------------------------------------------------------------------------------

## [Prototype](https://github.com/jeyakatsa/monalisa/tree/main/MVP)

#### Concept: 
<img src="https://github.com/jeyakatsa/monalisa/blob/main/MVP/ecare/prototypeConcept/PrototypeConceptHome(First-Draft).jpg" width="800px">

--------------------------------------------------

### [Roadmap](https://github.com/jeyakatsa/monalisa/blob/main/MVP/Readme.md)

#### [Combinatorial Auction Implementations](https://www.sciencedirect.com/topics/computer-science/combinatorial-auction)

#### [Combinatorial Auction Design ex.](https://www.jstor.org/stable/4133996)
