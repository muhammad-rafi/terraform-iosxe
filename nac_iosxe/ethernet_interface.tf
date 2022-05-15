# Configure or amend IPv4 address on the physical interface 
resource "iosxe_interface_ethernet" "ether_intf" {
  provider    = iosxe.cisco_sandbox
  type        = "GigabitEthernet"
  name        = "2"
  description = "Configured via Terraform"
  shutdown    = true
  # vrf_forwarding    = "VRF_1"
  ipv4_address      = "100.1.1.1"
  ipv4_address_mask = "255.255.255.0"
}

# Fetch the GigabitEthernet3 interface configuration 
data "iosxe_interface_ethernet" "data_ether_intf" {
  provider = iosxe.cisco_sandbox
  type     = "GigabitEthernet"
  name     = "3"
}

output "output_iosxe_interface_ethernet" {
  value = data.iosxe_interface_ethernet.data_ether_intf
}

# terraform import iosxe_interface_ethernet.ether_intf "Cisco-IOS-XE-native:native/interface/GigabitEthernet=3"
