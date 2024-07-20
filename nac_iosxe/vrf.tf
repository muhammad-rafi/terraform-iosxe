# # Create a vrf on the iosxe device
# resource "iosxe_vrf" "vrf_config" {
#   provider            = iosxe.cisco_sandbox
#   name                = "TERRAFORM_VRF"
#   description         = "Created by Terraform"
#   rd                  = "1:1"
#   address_family_ipv4 = true
#   address_family_ipv6 = true
#   vpn_id              = "1:1"
#   route_target_import = [
#     {
#       value     = "1:1"
#       stitching = false
#     }
#   ]
#   route_target_export = [
#     {
#       value     = "1:1"
#       stitching = false
#     }
#   ]
# }

# # Create multiple vrf on the iosxe device with variable and count
# resource "iosxe_vrf" "create_vrf" {
#   provider = iosxe.cisco_sandbox
#   count    = length(var.vrfs)
#   name     = var.vrfs[count.index]
# }

# Create multiple vrf on the iosxe device with variable and for_each
resource "iosxe_vrf" "create_vrf" {
  provider = iosxe.cisco_sandbox
  for_each = toset(var.vrfs)
  name     = each.value
}
