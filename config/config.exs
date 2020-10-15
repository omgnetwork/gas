import Config

config :gas, Gas.Integration.Pulse, api_key: System.get_env("PULSE_API_KEY")

config :gas, Gas.Integration.Web3Api,
  blockchain_id: System.get_env("WEB3API_BLOCKCHAIN_ID"),
  api_key: System.get_env("WEB3API_API_KEY")

config :gas, Gas.Integration.Etherscan, api_key: System.get_env("ETHERSCAN_API_KEY")

# config :gas,
#  order: [Gas.Integration.EthGasStationApi, Gas.Integration.GasPriceOracle, Gas.Integration.Pulse, Gas.Integration.Web3Api]
