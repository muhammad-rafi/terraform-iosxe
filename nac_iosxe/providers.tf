# Terraform and Network as Code iosxe Provider Declaration
terraform {
  required_providers {
    iosxe = {
      source  = "netascode/iosxe"
      version = ">=0.1.7"
    }
  }
  required_version = ">=1.1.8"
}

# Network as Code iosxe Provider Configuration
provider "iosxe" {
  alias    = "cisco_sandbox"
  username = var.username
  password = var.password
  # username = "developer"
  # password = "C1sco12345"
  url      = "https://sandbox-iosxe-latest-1.cisco.com"
  insecure = true
}

# # Network as Code iosxe Provider Configuration for multiple devices 
# provider "iosxe" {
#   alias    = "cml-csr8kv"
#   username = "admin"
#   password = "cisco123"
#   url      = "https://10.100.5.202"
# }

# provider "iosxe" {
#   alias    = "cml-iosvl2"
#   username = "admin"
#   password = "cisco123"
#   url      = "https://10.100.5.204"
# }

# # Network as Code iosxe Provider Configuration for multiple devices with local variables
# locals {
#   routers = [
#     {
#       name = "R1"
#       url  = "https://192.168.1.0"
#     },
#     {
#       name = "R2"
#       url  = "https://192.168.2.0"
#     },
#   ]
# }

# # Network as Code iosxe Provider Configuration for multiple devices
# provider "iosxe" {
#   alias    = "R1"
#   username = var.username
#   password = var.password
#   url      = "https://192.168.1.0"
#   insecure = true
# }

# provider "iosxe" {
#   alias    = "R2"
#   username = var.username
#   password = var.password
#   url      = "https://192.168.2.0"
#   insecure = true
# }

# resource "iosxe_restconf" "hostname" {
#   for_each   = toset([for router in local.routers : router.name])
#   device     = each.key
#   path       = "openconfig-system:system/config"
#   attributes = {
#     hostname = each.key
#   }
# }