# # Disable this since, we have providers.tf file
# # iosxe Provider Declaration
# terraform {
#   required_providers {
#     iosxe = {
#       version = ">=0.1.1"
#       source  = "CiscoDevNet/iosxe"
#     }
#   }
# }

# variable "login_credentials" {
#     type = object({
#         username = string
#         password = string
#     })
# }

# # Username for the iosxe provider
# variable "username" {
#   description = "Username to login to the iosxe device"
#   type        = string
#   default     = "developer"
# }

# # Password for the iosxe provider
# variable "password" {
#   description = "Password to login to the iosxe device"
#   type        = string
#   sensitive   = true
# }

# # iosxe Provider Configuration
# provider "iosxe" {
#   // Required but Optional if env variable are set
#   host            = "https://sandbox-iosxe-recomm-1.cisco.com"
#   device_username = var.username
#   device_password = var.password

#   // Optional Parameters
#   request_timeout = 30
#   insecure        = true
#   ca_file         = ""
#   proxy_url       = ""
#   proxy_creds     = ""
# }

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
  host            = "https://sandbox-iosxe-recomm-1.cisco.com"
  device_username = "developer"
  device_password = "C1sco12345"

  // Optional Parameters
  request_timeout = 30
  insecure        = true
  ca_file         = ""
  proxy_url       = ""
  proxy_creds     = ""
}
