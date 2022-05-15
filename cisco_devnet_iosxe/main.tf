# Fetch the Cisco IOSXE Native configuration
resource "iosxe_rest" "get_native_config" {
  method  = "GET"
  path    = "/data/Cisco-IOS-XE-native:native"
  payload = ""
}

# Fetch the information for the list of  interfaces on the device with 'data source'
data "iosxe_rest" "debug_get_native_config" {
  path = "/data/ietf-interfaces:interfaces/"
}

# Display the output of the above 'get_interfaces' data resource 
output "debug_native_config" {
  value = data.iosxe_rest.debug_get_native_config.response
}
