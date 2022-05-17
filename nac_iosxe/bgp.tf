# Network as Code iosxe Provider Declaration
provider "iosxe" {
  username = "developer"
  password = "C1sco12345"
  url      = "https://sandbox-iosxe-latest-1.cisco.com"
  insecure = true
}

# Configure BGP base configuration
module "bgp_module" {
  source = "./modules/bgp_config"
  bgp_conf_params = {
    asn                  = "65001"
    default_ipv4_unicast = true
    log_neighbor_changes = true
    router_id_loopback   = 100
  }
}

# Configure BGP neighbor configuration via module 
module "bgp_neigh_module" {
  source = "./modules/bgp_neigh_config"
  bgp_neigh_params = {
    asn                    = "65001"
    ip                     = "2.2.2.2"
    remote_as              = "65002"
    description            = "BGP Neighbor Description via terraform"
    admin_state            = false
    update_source_loopback = "100"
  }
}