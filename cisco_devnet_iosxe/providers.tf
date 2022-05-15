# Cisco DevNet iosxe Provider Declaration
terraform {
  required_providers {
    iosxe = {
      version = ">=0.1.1"
      source  = "CiscoDevNet/iosxe"
    }
  }
}

# Cisco DevNet iosxe Provider Configuration
provider "iosxe" {
  // Required but Optional if env variable are set
  host            = "https://sandbox-iosxe-latest-1.cisco.com"
  device_username = "developer"
  device_password = "C1sco12345"

  // Optional Parameters
  request_timeout = 30
  insecure        = true
  ca_file         = ""
  proxy_url       = ""
  proxy_creds     = ""
}
