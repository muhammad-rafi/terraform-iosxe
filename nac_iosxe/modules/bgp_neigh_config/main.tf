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

# Configure BGP neighbor configuration
resource "iosxe_bgp_neighbor" "bgp_neigh" {
  asn                    = var.bgp_neigh_params.asn
  ip                     = var.bgp_neigh_params.ip
  remote_as              = var.bgp_neigh_params.remote_as
  description            = var.bgp_neigh_params.description
  shutdown               = var.bgp_neigh_params.admin_state
  update_source_loopback = var.bgp_neigh_params.update_source_loopback
}
