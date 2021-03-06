# # Basic Examples of using the terraform randonm, local 'file' module and local Variables

# terraform {
#   required_version = ">= 1.1.8"
#   required_providers {
#     local      = ">= 1.4"
#     random     = ">= 3.1"
#   }
# }

# # Variables for local file 
# variable "file_name" {
#   type        = string
#   default     = "/Users/murafi/Terraform_Projects/terraform-iosxe/hosts.txt"
#   description = "Name and location of the file"
# }

# # Variable for list of hosts 
# variable "hosts" {
#   type        = list(any)
#   default     = ["10.0.0.1", "10.0.0.2", "10.0.0.3", "10.0.0.4"]
#   description = "IP addresses of the devices"
# }

# # Variable for file permissions
# locals {
#   dir_perm  = "0644"
#   file_perm = "0644"
# }

# # Create a local file 'hosts.txt'
# resource "local_file" "hosts" {
#   filename             = var.file_name
#   content              = "https://sandbox-iosxe-recomm-1.cisco.com"
#   directory_permission = local.dir_perm
#   file_permission      = local.file_perm
# }

# # Create a local file 'devices.txt' dynamically 
# resource "local_file" "devices" {
#   filename = "/Users/murafi/Terraform_Projects/terraform-iosxe/devices.txt"
#   content  = <<-EOT
#     %{for host in var.hosts~}
# ${host}
#     %{endfor~}
#     EOT
# }
