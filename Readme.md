<img src="https://github.com/jeyakatsa/monalisa/blob/main/assets/MonaLisa-Icon.png" width="100px">

# ECARE
## Ethereum Combinatorial Auction Rate Exchange

#### ECARE (previously known as MonaLisa) is an Ethereum Combinatorial Auction Rate Exchange meant to facilitate a self-sustaining exchange rate ecosystem immune to bear-markets. 

### Motivation:

Bear markets are insufficient for non-profits operating under Ethereum since ERC-20 tokens in their current forms are mostly used as investment contracts needing consistent investment to maintain their values.

ECARE tokens *(ERC-20 tokens using ECARE)* are not to be "bought and sold" but rather, only exchanged or "swapped" via AMMs (Automated Market Makers like Uniswap or an ECARE AMM). 

*Thus, ECARE token prices/market-caps rise and fall based on exchange rates agreed upon further calcifying a self-sustaining token ecosystem absent of consistent investment.*

### Mechanics (*in-development*):

In order for ECARE tokens to be successfully exchanged, they will need the consent of both parties *(like trading one NFT for another OR specifically speaking, trading 1 Yuan for 1 Dollar, or 50 Yuans for 1 Dollar, etc)*.

**Scenario 1:** *Party A agrees to exchange 1 of their Tokens for 1 Token from Party B.*

> ***Before Exchange***
> 
> | Party A Token              | Party B Token              |
> | -------------------------- | -------------------------- |
> | Market Cap = 2kUSD         | Market Cap = 1kUSD         |
> | Tokens In Circulation = 1k | Tokens In Circulation = 1k |
> | 1 Token = 2USD             | 1 Token = 1USD             |
> 
> ***After Exchange***
> 
> | Party A Token              | Party B Token              |
> | -------------------------- | -------------------------- |
> | Market Cap = 1.998kUSD     | Market Cap = 1.002kUSD     |
> | Tokens In Circulation = 1k | Tokens In Circulation = 1k |
> | 1 Token = 1.998USD         | 1 Token = 1.002USD         |

**Scenario 2:** *Party A agrees to exchange 50 of their Tokens for 1 Token from Party B.*

> ***Before Exchange***
> 
> | Party A Token              | Party B Token              |
> | -------------------------- | -------------------------- |
> | Market Cap = 2kUSD         | Market Cap = 1kUSD         |
> | Tokens In Circulation = 1k | Tokens In Circulation = 1k |
> | 1 Token = 2USD             | 1 Token = 1USD             |
> 
> ***After Exchange***
> 
> | Party A Token                 | Party B Token                  |
> | ----------------------------- | ------------------------------ |
> | Market Cap = 1.900kUSD        | Market Cap = 1.100kUSD         |
> | Tokens In Circulation = .951k | Tokens In Circulation = 1.049k |
> | 1 Token = 1.997USD            | 1 Token = 1.048USD             |

#### In Summary:

While at the expense of Party A, Part B's token/market-cap continues to increase in value. So unless Party B agrees to exchange its token, Party B's token continues to maintain its value shielded from exterior market dynamics.

ECARE's mechanics (unlike other exchange rate systems) isn't based on the market cap of the tokens, but is based solely on the tokens in circulation, thus absolving token dependency of bear or bull markets.

--------------------------------------------------

### More Info:

[Combinatorial Auction Implementations](https://www.sciencedirect.com/topics/computer-science/combinatorial-auction)

[Combinatorial Auction Design ex.](https://www.jstor.org/stable/4133996)
