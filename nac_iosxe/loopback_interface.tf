# # Create a loopback interface 999, it uses HTTP PATCH Method 
# resource "iosxe_interface_loopback" "interface_loopback" {
#   provider    = iosxe.cisco_sandbox
#   name        = 999
#   description = "Created via Terraform"
#   shutdown    = false
#   vrf_forwarding    = "VRF_1"
#   ipv4_address      = "10.0.99.10"
#   ipv4_address_mask = "255.255.255.255"
#   # pim_sparse_mode   = true
# }

# # Fetch the loopback interface 999 configuration 
# data "iosxe_interface_loopback" "data_interface_loopback" {
#   provider = iosxe.cisco_sandbox
#   name     = 999
# }

# # Save the loopback interface 999 ipv4 address as output variable 
# output "output_interface_loopback" {
#   value = data.iosxe_interface_loopback.data_interface_loopback.ipv4_address
# }

# Note: To change the IP Address, just change the IP and reapply again

# # Create loopback interfaces defined in variable.tf via "count" 
# resource "iosxe_interface_loopback" "interface_loopback" {
#   provider    = iosxe.cisco_sandbox
#   count       = length(var.loopback_interfaces)
#   name        = var.loopback_interfaces[count.index].name
#   description = var.loopback_interfaces[count.index].description
#   shutdown    = var.loopback_interfaces[count.index].admin_status
#   # vrf_forwarding    = var.loopback_interfaces[count.index].vrf_forwarding
#   ipv4_address      = var.loopback_interfaces[count.index].ipv4_address
#   ipv4_address_mask = var.loopback_interfaces[count.index].ipv4_address_mask
# }

# # Create loopback interfaces defined in variable.tf via "for_each" with "for loop"
# resource "iosxe_interface_loopback" "interface_loopback" {
#   provider    = iosxe.cisco_sandbox
#   # for_each   = {for index, interface in var.loopback_interfaces: index => interface}
#   for_each   = {for index, interface in var.loopback_interfaces: interface.name => interface}
#   name        = each.value.name
#   description = each.value.description
#   shutdown    = each.value.admin_status
#   # vrf_forwarding    = each.value.vrf_forwarding
#   ipv4_address      = each.value.ipv4_address
#   ipv4_address_mask = each.value.ipv4_address_mask
# }

# Create loopback interfaces defined in variable.tf via "for_each" with "toset"
resource "iosxe_interface_loopback" "interface_loopback" {
  provider    = iosxe.cisco_sandbox
  for_each    = toset(keys({ for index, interface in var.loopback_interfaces : index => interface }))
  name        = var.loopback_interfaces[each.value]["name"]
  description = var.loopback_interfaces[each.value]["description"]
  shutdown    = var.loopback_interfaces[each.value]["admin_status"]
  # vrf_forwarding    = var.loopback_interfaces[each.value]["vrf_forwarding"]
  ipv4_address      = var.loopback_interfaces[each.value]["ipv4_address"]
  ipv4_address_mask = var.loopback_interfaces[each.value]["ipv4_address_mask"]
}
