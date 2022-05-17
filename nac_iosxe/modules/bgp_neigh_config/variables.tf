# Variable for bgp_neigh_config module 
variable "bgp_neigh_params" {
  type = object({
    asn                    = string
    ip                     = string
    remote_as              = string
    description            = string
    admin_state            = bool
    update_source_loopback = string
  })
}
