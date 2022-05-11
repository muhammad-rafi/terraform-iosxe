# Network To Code iosxe Provider Declaration
terraform {
  required_providers {
    iosxe = {
      source  = "netascode/iosxe"
      version = "0.1.4"
    }
  }
}

# Network To Code iosxe Provider Configuration
provider "iosxe" {
  alias    = "cisco_sandbox"
  username = "developer"
  password = "C1sco12345"
  url      = "https://sandbox-iosxe-recomm-1.cisco.com"
}