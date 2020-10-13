defmodule Gas.Integration.Pulse do
  def url() do
    "https://data-api.defipulse.com/"
  end

  def map2struct(body) do
    %Gas{
      fast: body["fast"],
      fastest: body["fastest"],
      standard: body["average"],
      low: body["safeLow"]
    }
  end

  #     Gas.get(url: "https://data-api.defipulse.com/api/v1/egs/api/ethgasAPI.json?api-key=1107c953f9990f7a12a027cf843736c96705b24896e6ee8c274a771e8825")
  # {:ok,
  #  %HTTPoison.Response{
  #    body: "{\"fast\":680,\"fastest\":720,\"safeLow\":600,\"average\":600,\"block_time\":16.729166666666668,\"blockNum\":11041071,\"speed\":0.9975775322359668,\"safeLowWait\":1.6,\"avgWait\":1.6,\"fastWait\":0.7,\"fastestWait\":0.6,\"gasPriceRange\":{\"4\":278.8,\"6\":278.8,\"8\":278.8,\"10\":278.8,\"20\":278.8,\"30\":278.8,\"40\":278.8,\"50\":278.8,\"60\":278.8,\"70\":278.8,\"80\":278.8,\"90\":278.8,\"100\":278.8,\"110\":278.8,\"120\":278.8,\"130\":278.8,\"140\":278.8,\"150\":278.8,\"160\":278.8,\"170\":278.8,\"180\":278.8,\"190\":278.8,\"200\":278.8,\"220\":278.8,\"240\":278.8,\"260\":278.8,\"280\":278.8,\"300\":278.8,\"320\":278.8,\"340\":278.8,\"360\":278.8,\"380\":278.8,\"400\":278.8,\"420\":278.8,\"440\":278.8,\"460\":278.8,\"480\":278.8,\"500\":278.8,\"520\":278.8,\"540\":278.8,\"560\":278.8,\"580\":278.8,\"600\":1.6,\"620\":1.1,\"640\":0.9,\"660\":0.8,\"680\":0.7,\"700\":0.7,\"720\":0.6}}",
  #    headers: [
  #      {"Date", "Mon, 12 Oct 2020 13:35:47 GMT"},
  #      {"Content-Type", "application/json; charset=utf-8"},
  #      {"Content-Length", "775"},
  #      {"Connection", "keep-alive"},
  #      {"Set-Cookie",
  #       "__cfduid=d2f6aa64598d774a12e75b97513a23fec1602509746; expires=Wed, 11-Nov-20 13:35:46 GMT; path=/; domain=.defipulse.com; HttpOnly; SameSite=Lax; Secure"},
  #      {"Set-Cookie",
  #       "AWSALB=doN/FIQOK2zoRwK5rdPmXyxgbu8tOi1NFYtrw36lx5USMmf3aahm2Ojvk/1MOnU5ho3mzvkSQAFKmAFscPQMrG1rH+WjlgMgaF1t/TSU2KEVNbpboYpq7MIdU72P; Expires=Mon, 19 Oct 2020 13:35:47 GMT; Path=/"},
  #      {"Set-Cookie",
  #       "AWSALBCORS=doN/FIQOK2zoRwK5rdPmXyxgbu8tOi1NFYtrw36lx5USMmf3aahm2Ojvk/1MOnU5ho3mzvkSQAFKmAFscPQMrG1rH+WjlgMgaF1t/TSU2KEVNbpboYpq7MIdU72P; Expires=Mon, 19 Oct 2020 13:35:47 GMT; Path=/; SameSite=None; Secure"},
  #      {"Access-Control-Allow-Origin", "*"},
  #      {"Access-Control-Allow-Credentials", "false"},
  #      {"Access-Control-Allow-Methods", "GET,POST,PUT,DELETE"},
  #      {"Access-Control-Allow-Headers",
  #       "Accept, Authorization, Content-Type, If-None-Match, X-Requested-With"},
  #      {"Access-Control-Max-Age", "1728000"},
  #      {"cache-control", "no-cache"},
  #      {"accept-ranges", "bytes"},
  #      {"CF-Cache-Status", "DYNAMIC"},
  #      {"cf-request-id", "05be9f4b030000cddb28258200000001"},
  #      {"Expect-CT",
  #       "max-age=604800, report-uri=\"https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct\""},
  #      {"Report-To",
  #       "{\"endpoints\":[{\"url\":\"https:\\/\\/a.nel.cloudflare.com\\/report?lkg-colo=19&lkg-time=1602509748\"}],\"group\":\"cf-nel\",\"max_age\":604800}"},
  #      {"NEL", "{\"report_to\":\"cf-nel\",\"max_age\":604800}"},
  #      {"Server", "cloudflare"},
  #      {"CF-RAY", "5e1134be6cefcddb-CDG"}
  #    ],
  #    request: %HTTPoison.Request{
  #      body: "",
  #      headers: [{"Accept", "application/json"}],
  #      method: :get,
  #      options: [],
  #      params: %{},
  #      url: "https://data-api.defipulse.com/api/v1/egs/api/ethgasAPI.json?api-key=1107c953f9990f7a12a027cf843736c96705b24896e6ee8c274a771e8825"
  #    },
  #    request_url: "https://data-api.defipulse.com/api/v1/egs/api/ethgasAPI.json?api-key=1107c953f9990f7a12a027cf843736c96705b24896e6ee8c274a771e8825",
  #    status_code: 200
  #  }}
  # end
end
