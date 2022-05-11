# Create a vrf on the iosxe device
resource "iosxe_vrf" "example" {
  provider   = iosxe.cisco_sandbox
  name                = "TERRAFORM_VRF"
  description         = "Created by Terraform"
  rd                  = "1:1"
  address_family_ipv4 = true
  address_family_ipv6 = true
  vpn_id              = "1:1"
  route_target_import = [
    {
      value     = "1:1"
      stitching = false
    }
  ]
  route_target_export = [
    {
      value     = "1:1"
      stitching = false
    }
  ]
}
