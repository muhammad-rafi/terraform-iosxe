# Terraform and Network as Code iosxe Provider Declaration
terraform {
  required_providers {
    iosxe = {
      source  = "netascode/iosxe"
      version = "0.1.7"
    }
  }
  required_version = ">=1.1.8"
}

# Configure BGP base configuration
resource "iosxe_bgp" "bgp_proc" {
  asn                  = var.bgp_conf_params.asn
  default_ipv4_unicast = var.bgp_conf_params.default_ipv4_unicast
  log_neighbor_changes = var.bgp_conf_params.log_neighbor_changes
  router_id_loopback   = var.bgp_conf_params.router_id_loopback
}


