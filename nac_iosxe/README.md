## Introduction

This project is using the Network as Code IOSXE Terraform provider to configure the iosxe device or multiple devices via terraform, please check out the documentation at https://registry.terraform.io/providers/netascode/iosxe/latest/docs.

##### Network as Code Terraform Provider Registry 
https://registry.terraform.io/providers/netascode/iosxe/latest

## Example

This is code is basic example of running the terraform for iosxe device, you can copy this and create a `main.tf` file and run the following commands. 

* terraform validate 
* terraform plan
* terraform apply -auto-approve

``` hcl
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
```

## Author 
[Muhammad Rafi](https://www.linkedin.com/in/muhammad-rafi-0a37a248/)