Kind           = "service-resolver"
Name           = "public-api"
ConnectTimeout = "15s"
Failover = {
  "*" = {
    Targets = [
      {Peer = "dcanadillas-sec-default"}
    ]
  }
}