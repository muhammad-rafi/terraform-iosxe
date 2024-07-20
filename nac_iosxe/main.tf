# Configure the hostname of the device 
resource "iosxe_system" "hostname_config" {
  provider = iosxe.cisco_sandbox
  #   hostname             = "cml-c1000v"
  hostname = var.hostname
  #   ipv6_unicast_routing = true
}

# /* Import the current hostname of the device
# terraform import iosxe_system.hostname_config "Cisco-IOS-XE-native:native/hostname" */

# # Configure BGP base configuration
# resource "iosxe_bgp" "bgp_proc" {
#   provider             = iosxe.cisco_sandbox
#   asn                  = "65001"
#   default_ipv4_unicast = true
#   log_neighbor_changes = true
#   router_id_loopback   = 100
# }

# /* Import the existing bgp config to update the state file.
# terraform import iosxe_bgp.example "Cisco-IOS-XE-native:native/router/Cisco-IOS-XE-bgp:bgp=65000" */

# # Configure BGP neighbor configuration
# resource "iosxe_bgp_neighbor" "bgp_neigh" {
#   provider               = iosxe.cisco_sandbox
#   asn                    = "65001"
#   ip                     = "2.2.2.2"
#   remote_as              = "65002"
#   description            = "BGP Neighbor Description via terraform"
#   shutdown               = false
#   update_source_loopback = "100"
# }

# /* Import the existing bgp neighbor config to update the state file.
# terraform import iosxe_bgp_neighbor.example "Cisco-IOS-XE-native:native/router/Cisco-IOS-XE-bgp:bgp=65000/neighbor=3.3.3.3" */


# /* Import the current hostname to update the state file.
# terraform import iosxe_system.example "Cisco-IOS-XE-native:native" */

# # Add or amend a user 
# resource "iosxe_username" "user_add" {
#   provider = iosxe.cisco_sandbox
#   name                = "netadmin"
#   privilege           = 15
#   description         = "network administrator"
#   password_encryption = "7"
#   password            = "mysecret"
# }

# /* Import the existing user from the device
# terraform import iosxe_username.example "Cisco-IOS-XE-native:native/username=user1" */

# # Set the banners on the device
# resource "iosxe_banner" "banner_config" {
#   provider = iosxe.cisco_sandbox
#   exec_banner           = "Exec Authorize Login"
#   login_banner          = "Banner before the authentication prompt"
#   prompt_timeout_banner = "My Prompt-Timeout Banner"
#   motd_banner           = "Message Of the Day"
# }

# /* Import the currently configured banners
# terraform import iosxe_banner.example "Cisco-IOS-XE-native:native/banner" */

# # Configure VRF on the device 
# resource "iosxe_vrf" "vrf_config" {
#   provider = iosxe.cisco_sandbox
#   name                = "VRF_1"
#   description         = "Terrform VRF"
#   rd                  = "10:10"
#   address_family_ipv4 = true
#   address_family_ipv6 = true
#   vpn_id              = "10:10"
#   route_target_import = [
#     {
#       value     = "10:10"
#       stitching = false
#     }
#   ]
#   route_target_export = [
#     {
#       value     = "10:10"
#       stitching = false
#     }
#   ]
# }
# /* Import the VRF_1 configuration  
# terraform import iosxe_vrf.example "Cisco-IOS-XE-native:native/vrf/definition=VRF_1" */

# # Configure VLAN on the device 
# resource "iosxe_vlan" "example" {
#   provider = iosxe.cisco_sandbox
#   vlan_id  = 10
#   name     = "Vlan_10"
#   shutdown = false
# }

# /* Import the VLAN configuration  
# terraform import iosxe_vlan.example "Cisco-IOS-XE-native:native/vlan/Cisco-IOS-XE-vlan:vlan-list=123" */

# # Configure or amend IPv4 address on the physical interface 
# resource "iosxe_interface_ethernet" "interface_config" {
#   provider = iosxe.cisco_sandbox
#   type              = "GigabitEthernet"
#   name              = "3"
#   description       = "Configure via Terraform"
#   shutdown          = true
#   vrf_forwarding    = "VRF_1"
#   ipv4_address      = "100.1.1.1"
#   ipv4_address_mask = "255.255.255.0"
# }

# /* Import the physical inteface configuration 
# terraform import iosxe_interface_ethernet.example "Cisco-IOS-XE-native:native/interface/GigabitEthernet=3" */

# # Create a loopback interface 100, it uses HTTP PATCH Method 
# resource "iosxe_interface_loopback" "interface_loopback" {
#   provider = iosxe.cisco_sandbox
#   name        = 100
#   description = "Created via Terraform"
#   shutdown    = false
#   vrf_forwarding    = "VRF_1"
#   ipv4_address      = "10.100.0.10"
#   ipv4_address_mask = "255.255.255.255"
#   # pim_sparse_mode   = true
# }

# /* Import the loopback interface configuration 
# terraform import iosxe_interface_loopback.example "Cisco-IOS-XE-native:native/interface/Loopback=100" */

# # Create a switch virtual interface 10
# resource "iosxe_interface_vlan" "interface_svi" {
#   provider = iosxe.cisco_sandbox
#   name              = 10
#   autostate         = false
#   description       = "My Interface Description"
#   shutdown          = false
#   vrf_forwarding    = "VRF_1"
#   ipv4_address      = "10.200.0.1"
#   ipv4_address_mask = "255.255.255.0"
# }

# /* Import the SVI 10 configuration 
# terraform import iosxe_interface_vlan.example "Cisco-IOS-XE-native:native/interface/Vlan=10" */

# # Add a static route to the iosxe device on global routing table
# resource "iosxe_static_route" "static_route" {
#   provider = iosxe.cisco_sandbox
#   prefix   = "10.100.0.0"
#   mask     = "255.255.255.0"
#   next_hops = [
#     {
#       next_hop  = "10.100.0.1"
#       metric    = 10
#       global    = false
#       name      = "terraform_route"
#       permanent = true
#       tag       = 100
#     }
#   ]
# }

# /* Import the static route from the device 
# terraform import iosxe_static_route.static_route "Cisco-IOS-XE-native:native/ip/route/ip-route-interface-forwarding-list=10.100.0.0,255.255.255.0" */

