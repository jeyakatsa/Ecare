<img src="https://github.com/jeyakatsa/monalisa/blob/main/assets/EcareIcon.png" width="60px">

# ECARE
## Ethereum Combinatorial Auction Rate Exchange

#### ECARE (previously known as MonaLisa) is an Ethereum Combinatorial Auction Rate Exchange meant to facilitate a self-sustaining exchange rate ecosystem immune to bear-markets. 

### Motivation:

Bear markets are insufficient for non-profits operating under Ethereum since ERC-20 tokens in their current forms are mostly used as investment contracts needing consistent investment to maintain their values.

ECARE tokens *(ERC-20 tokens using ECARE)* are not to be "bought and sold" but rather, only exchanged or "swapped" via AMMs (Automated Market Makers like Uniswap or an ECARE AMM). 

*Thus, ECARE token prices/market-caps rise and maintain value based on exchange rates agreed upon further calcifying a self-sustaining token ecosystem absent of consistent investment.*

### Mechanics:

Unlike other exchange rate systems, ECARE's system isn't based on the market caps of the tokens, but is based solely on the tokens in circulation. Thus the mechanics that helps it remain immune from bear-markets, are the values from lesser market cap tokens negated during exchanges. 

**Scenario 1:** *Party A agrees to exchange 1 of their Tokens for 1 Token from Party B.*

> ***Before Exchange***
> 
> | Party A Token                 | Party B Token                 |
> | ----------------------------- | ----------------------------- |
> | Market Cap = 2,000 USD        | Market Cap = 1,000 USD        |
> | Tokens In Circulation = 1,000 | Tokens In Circulation = 1,000 |
> | 1 Token = 2 USD               | 1 Token = 1 USD               |
> 
> ***After Exchange***
> 
> | Party A Token                 | Party B Token                 |
> | ----------------------------  | ----------------------------- |
> | Market Cap = 2,000 USD        | Market Cap = 1,002 USD        |
> | Tokens In Circulation = 1,000 | Tokens In Circulation = 1,000 |
> | 1 Token = 2 USD               | 1 Token = 1.002 USD           |

**Scenario 2:** *Party A agrees to exchange 50 of their Tokens for 1 Token from Party B.*

> ***Before Exchange***
> 
> | Party A Token                 | Party B Token                 |
> | ----------------------------- | ----------------------------- |
> | Market Cap = 2,000 USD        | Market Cap = 1,000 USD        |
> | Tokens In Circulation = 1,000 | Tokens In Circulation = 1,000 |
> | 1 Token = 2 USD               | 1 Token = 1 USD               |
> 
> ***After Exchange***
> 
> | Party A Token                 | Party B Token                  |
> | ----------------------------- | ------------------------------ |
> | Market Cap = 2,000 USD        | Market Cap = 1,099 USD         |
> | Tokens In Circulation = 951   | Tokens In Circulation = 1,049  |
> | 1 Token = 2.103 USD           | 1 Token = 1.048 USD            |

--------------------------------------------------

#### More Info:

[Combinatorial Auction Implementations](https://www.sciencedirect.com/topics/computer-science/combinatorial-auction)

[Combinatorial Auction Design ex.](https://www.jstor.org/stable/4133996)
