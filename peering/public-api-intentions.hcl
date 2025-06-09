Kind = "service-intentions"
Name = "public-api"
Sources = [
  {
    Name   = "front-service"
    Action = "allow"
    Peer = "gcp-dc1-default"
  }
]
