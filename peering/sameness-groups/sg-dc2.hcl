Kind                     = "sameness-group"
Name                     = "api-services"
Partition                = "default"
DefaultForFailover = true
Members = [
    { Partition = "default" },
    { Peer      = "hashistack-gcp-default" }
]
