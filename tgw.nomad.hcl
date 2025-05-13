variable "datacenter" {
  default = "dc1"
}
job "terminating-gateway" {

  datacenters = ["${var.datacenter}"]
  group "gateway" {
    network {
      mode = "bridge"
    }

    service {
      name = "terminating-gateway"

      connect {
        gateway {
          proxy {
            #envoy_dns_discovery_type = "STRICT_DNS"
          }

          terminating {
            service {
              name = "test-destination"
            }
            service {
              name = "tls-destination"
            }
            service {
              name = "external-nginx"
            }
          }
        }
      }
    }
  }
}
