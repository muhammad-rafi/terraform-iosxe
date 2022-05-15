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

# Create loopback interfaces defined in variable.tf via "count" 
resource "iosxe_interface_loopback" "interface_loopback" {
  provider    = iosxe.cisco_sandbox
  count       = length(var.loopback_interfaces)
  name        = var.loopback_interfaces[count.index].name
  description = var.loopback_interfaces[count.index].description
  shutdown    = var.loopback_interfaces[count.index].admin_status
  # vrf_forwarding    = var.loopback_interfaces[count.index].vrf_forwarding
  ipv4_address      = var.loopback_interfaces[count.index].ipv4_address
  ipv4_address_mask = var.loopback_interfaces[count.index].ipv4_address_mask
}

# # Create loopback interfaces defined in variable.tf via "for_each" 
# resource "iosxe_interface_loopback" "interface_loopback" {
#   provider    = iosxe.cisco_sandbox
#   for_each       = var.loopback_interfaces
#   name        = var.loopback_interfaces[count.index].name
#   description = var.loopback_interfaces[count.index].description
#   shutdown    = var.loopback_interfaces[count.index].admin_status
#   # vrf_forwarding    = var.loopback_interfaces[count.index].vrf_forwarding
#   ipv4_address      = var.loopback_interfaces[count.index].ipv4_address
#   ipv4_address_mask = var.loopback_interfaces[count.index].ipv4_address_mask
# }