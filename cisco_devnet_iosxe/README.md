## Introduction

This project is using the Cisco DevNet IOSXE Terraform provider to configure the iosxe device, please check out the documentation at https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs.


## Example

Following code is a basic example of running the terraform against a Cisco iosxe device to retrieve the native configuration.

Terraform commands to run on the terminal to format, validate, dry run and commit the change respectively. 

``` bash
$ terraform fmt
$ terraform validate 
$ terraform plan
$ terraform apply -auto-approve
```

`provider.tf`
``` hcl
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
```

`main.tf`
``` hcl
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
```

## Author 
[Muhammad Rafi](https://www.linkedin.com/in/muhammad-rafi-0a37a248/)