# Fetch the Cisco IOSXE Native configuration
resource "iosxe_rest" "get_all_native_config" {
  method  = "GET"
  path    = "/data/Cisco-IOS-XE-native:native"
  payload = ""
}

# Fetch the information for the list of  interfaces on the device with 'data source'
data "iosxe_rest" "get_interfaces" {
  path = "/data/ietf-interfaces:interfaces/"
}

# Display the output of the above 'get_interfaces' data resource 
output "debug_get_interfaces" {
  value = data.iosxe_rest.get_interfaces.response
}

# Fetch the available NTP configuration
resource "iosxe_rest" "get_ntp" {
  method = "GET"
  path   = "/data/Cisco-IOS-XE-native:native/ntp"
}

# Display the output of the above resource 
output "debug_get_ntp_debug" {
  value = iosxe_rest.get_ntp.response
}