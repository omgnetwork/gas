# Gas
Now they don't allow multiple API keys (or projects), so for CircleCI I'm using my own (ino@omg.network). If the API key ever expires, just create a new one and set it in the ENVIORNMENT VARIABLES section of CirleCI.

If you want to use https://data-beta.defipulse.com/dashboard/egs 
PULSE_API_KEY=<>

If you want to use https://docs.amberdata.io/reference#get-gas-predictions
WEB3API_BLOCKCHAIN_ID=ethereum-mainnet 
WEB3API_API_KEY=<>


ETH Gas Station API is https://www.ethgasstationapi.com/. Seems to be free. But currently disabled since the SSL cert expired. (15 October 2020)
Gas Price Oracle is https://www.etherchain.org/. Seems to be free.
Etherscan is https://etherscan.io/apis#gastracker. Seems to be free (rate limit of 1/5sec applied).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gas` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gas, "~> 0.1.0"}
  ]
end
```

