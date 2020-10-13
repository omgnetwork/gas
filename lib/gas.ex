defmodule Gas do
  @moduledoc """
  Documentation for `Gas` access from various integrations.
  """
  defstruct [:fastest, :fast, :standard, :low]
  alias Gas.Request
  alias Gas.Response
  alias Gas.Decode
  alias Gas.Normalize

  def get(), do: get([])

  def get(opts) do
    opts
    |> Request.get()
    |> Response.response()
    |> Decode.decode()
    |> Normalize.normalize()
  end
end

# curl --request GET --url https://data-api.defipulse.com/api/v1/egs/api/ethgasAPI.json?api-key=1107c953f9990f7a12a027cf843736c96705b24896e6ee8c274a771e8825 | jq
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100   714  100   714    0     0    619      0  0:00:01  0:00:01 --:--:--   619
# {
#   "fast": 570,
#   "fastest": 610,
#   "safeLow": 500,
#   "average": 500,
#   "block_time": 16.26829268292683,
#   "blockNum": 11040969,
#   "speed": 0.9907726814599116,
#   "safeLowWait": 1.6,
#   "avgWait": 1.6,
#   "fastWait": 0.7,
#   "fastestWait": 0.6,
#   "gasPriceRange": {
#     "4": 271.1,
#     "6": 271.1,
#     "8": 271.1,
#     "10": 271.1,
#     "20": 271.1,
#     "30": 271.1,
#     "40": 271.1,
#     "50": 271.1,
#     "60": 271.1,
#     "70": 271.1,
#     "80": 271.1,
#     "90": 271.1,
#     "100": 271.1,
#     "110": 271.1,
#     "120": 271.1,
#     "130": 271.1,
#     "140": 271.1,
#     "150": 271.1,
#     "160": 271.1,
#     "170": 271.1,
#     "180": 271.1,
#     "190": 271.1,
#     "210": 271.1,
#     "230": 271.1,
#     "250": 271.1,
#     "270": 271.1,
#     "290": 271.1,
#     "310": 271.1,
#     "330": 271.1,
#     "350": 271.1,
#     "370": 271.1,
#     "390": 271.1,
#     "410": 271.1,
#     "430": 271.1,
#     "450": 271.1,
#     "470": 271.1,
#     "490": 271.1,
#     "500": 1.6,
#     "510": 1.4,
#     "530": 1.3,
#     "550": 1.1,
#     "570": 0.7,
#     "590": 0.6,
#     "610": 0.6
#   }
# }

# curl --request GET --url https://www.ethgasstationapi.com/api/low
# 50.0000
# curl --request GET --url https://www.ethgasstationapi.com/api/standard
# 50.0000
# curl --request GET --url https://www.ethgasstationapi.com/api/fast
# 50.0000

# curl --request GET --url https://www.etherchain.org/api/gasPriceOracle | jq
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100    52    0    52    0     0     62      0 --:--:-- --:--:-- --:--:--    62
# {
#   "safeLow": 51,
#   "standard": 57,
#   "fast": 59,
#   "fastest": 71
# }

# curl --request GET   --url https://web3api.io/api/v2/transactions/gas/predictions   --header 'x-amberdata-blockchain-id: ethereum-mainnet'   --header 'x-api-key: UAK8cdca46ebd7781fea30ace4b700d8892' | jq
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100   313  100   313    0     0    745      0 --:--:-- --:--:-- --:--:--   745
# {
#   "status": 200,
#   "title": "OK",
#   "description": "Successful request",
#   "payload": {
#     "average": {
#       "gasPrice": 49000000000,
#       "numBlocks": 8,
#       "wait": 2.1
#     },
#     "fast": {
#       "gasPrice": 57000000000,
#       "numBlocks": 3,
#       "wait": 0.8
#     },
#     "fastest": {
#       "gasPrice": 61000000000,
#       "numBlocks": 3,
#       "wait": 0.6
#     },
#     "safeLow": {
#       "gasPrice": 41000000000,
#       "numBlocks": 69,
#       "wait": 18.3
#     }
#   }
# }
