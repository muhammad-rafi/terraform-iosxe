# resource "iosxe_vlan" "l2_vlan_create" {
#   provider = iosxe.cisco_sandbox
#   count    = length(var.vlan_ids)
#   vlan_id  = var.vlan_ids[count.index]
#   name     = "VLAN_${var.vlan_ids[count.index]}"
#   shutdown = false
# }
