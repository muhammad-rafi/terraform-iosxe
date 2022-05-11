# Create a loopback interface 999, it uses HTTP PATCH Method 
resource "iosxe_interface_loopback" "interface_loopback" {
  provider    = iosxe.cisco_sandbox
  name        = 999
  description = "Created via Terraform"
  shutdown    = false
  # vrf_forwarding    = "VRF1"
  ipv4_address      = "10.0.99.10"
  ipv4_address_mask = "255.255.255.255"
  # pim_sparse_mode   = true
}

# Fetch the loopback interface 999 configuration 
data "iosxe_interface_loopback" "data_interface_loopback" {
  provider    = iosxe.cisco_sandbox
  name = 999
}

# Save the loopback interface 100 ipv4 address as output variable 
output "output_interface_loopback" {
  value = data.iosxe_interface_loopback.data_interface_loopback.ipv4_address
}

# Note: To change the IP Address, just change the IP and reapply again

# Reference: https://registry.terraform.io/providers/netascode/iosxe/latest/docs/data-sources/interface_loopback

# Commands to run on the terminal
# terraform validate
# terraform plan
# terraform apply -auto-approve
# terraform output 
# terraform output output_interface_loopback

# Target specific resource "iosxe_interface_loopback"
# terraform plan  -target iosxe_interface_loopback.interface_loopback
# terraform apply -auto-approve -target iosxe_interface_loopback.interface_loopback