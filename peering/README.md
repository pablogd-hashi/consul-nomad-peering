# Establishing the cluster peering
> NOTE: We need to have deployed a second cluster with the Terraform config that we have in https://app.terraform.io/app/hc-dcanadillas/workspaces/nomad-consul-gcp-sec/

## Configuring Consul
We need to configure `PeerThroughMeshGateways` in the two Consul clusters that will be peered.
```bash
consul config write mesh.hcl
```

Generate the token in Cluster DC1 (`dcanadillas`)
```bash
PEERING_TOKEN=$(consul peering generate-token -name dcanadillas-sec-default)
```

Establish the peering from the second cluster:
``bash
export CONSUL_HTTP_ADDR="<addr_of_dcanadillas_sec>
export CONSUL_HTTP_TOKEN="<Consul_token_of_second_cluster>"
consul peering establish -name dcanadillas-default -peering-token $PEERING_TOKEN
```

