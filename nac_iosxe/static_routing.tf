# Add a static route to the iosxe device on global routing table
resource "iosxe_static_route" "static_route" {
  provider   = iosxe.cisco_sandbox
  prefix = "10.0.0.0"
  mask   = "255.255.255.0"
  next_hops = [
    {
      next_hop  = "10.1.10.1"
      metric    = 10
      global    = false
      name      = "terraform_route"
      permanent = true
      tag       = 100
    }
  ]
}

# Take the output of the "iosxe_static_route" resource for the output variable 
output "output_static_route" {
  value = iosxe_static_route.static_route
}

# Fetch the static route from the iosxe device  
data "iosxe_static_route" "static_route_data" {
  provider   = iosxe.cisco_sandbox
  prefix = "10.0.0.0"
  mask   = "255.255.255.0"
}

# $ terraform import iosxe_static_route.static_route "Cisco-IOS-XE-native:native/ip/route/ip-route-interface-forwarding-list=10.0.0.10,255.255.255.0"
