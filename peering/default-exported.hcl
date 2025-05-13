Kind = "exported-services"
Name = "default"

Services = [
  {
    Name      = "public-api"
    Consumers = [
        {
            Peer  = "dcanadillas-default"
        },
    ]
  },
  {
    Name      = "private-api"
    Consumers = [
        {
            Peer = "dcanadillas-default"
        }
    ]
  }
]
