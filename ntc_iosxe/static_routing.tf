# Add a static route to the iosxe device on global routing table
resource "iosxe_static_route" "static_route" {
  provider   = iosxe.cisco_sandbox
  device = "sandbox-iosxe-recomm-1.cisco.com"
  prefix = "10.0.0.10"
  mask   = "255.255.255.0"
  next_hops = [
    {
      next_hop  = "10.0.0.1"
      metric    = 10
      global    = false
      name      = "terraform_route"
      permanent = true
      tag       = 100
    }
  ]
}

# # Take the output of the "iosxe_static_route" resource for the output variable 
# output "output_static_route" {
#   value = iosxe_static_route.static_route
# }

# data "iosxe_static_route" "static_route_data" {
#   provider   = iosxe.cisco_sandbox
#   prefix = "10.0.0.10"
#   mask   = "255.255.255.255"
# }

