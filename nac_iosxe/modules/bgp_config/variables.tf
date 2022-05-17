# Variable for bgp_config module 
variable "bgp_conf_params" {
  type = object({
    asn                  = string
    default_ipv4_unicast = bool
    log_neighbor_changes = bool
    router_id_loopback   = number
  })
  description = "object variable for the base bgp config"
}

# # Variable for bgp_config module with default values
# variable "bgp_conf_params" {
#     type = object({
#       asn                  = string
#       default_ipv4_unicast = bool
#       log_neighbor_changes = bool
#       router_id_loopback   = number
#       })
#     description = "object variable"
#     default = {
#       asn                  = "65001"
#       default_ipv4_unicast = true
#       log_neighbor_changes = true
#       router_id_loopback   = 100
#       }
#     }

