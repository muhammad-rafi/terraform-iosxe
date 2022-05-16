# Username for the iosxe provider
variable "username" {
  description = "Username to login to the iosxe device"
  type        = string
  default     = "developer"
}

# Password for the iosxe provider
variable "password" {
  description = "Password to login to the iosxe device"
  type        = string
  default     = "C1sco12345"
  #   sensitive   = true
}

# Hostname for the iosxe device
variable "hostname" {
  description = "configure hostname for the iosxe device"
  type        = string
}

# List of Objects Variable for loopback interfaces 
variable "loopback_interfaces" {
  type = list(object({
    name              = number
    description       = string
    ipv4_address      = string
    ipv4_address_mask = string
    # vrf_forwarding    = string
    admin_status = bool
  }))
  description = "list of objects"
  default = [
    {
      name              = 100
      description       = "Created via variable.tf"
      ipv4_address      = "10.0.1.10"
      ipv4_address_mask = "255.255.255.255"
      # vrf_forwarding    = "VRF_1"
      admin_status = false
    },
    {
      name              = 200
      description       = "Created via variable.tf"
      ipv4_address      = "10.0.2.10"
      ipv4_address_mask = "255.255.255.255"
      # vrf_forwarding    = "VRF_2"
      admin_status = false
    },
    {
      name              = 300
      description       = "Created via variable.tf"
      ipv4_address      = "10.0.3.10"
      ipv4_address_mask = "255.255.255.255"
      # vrf_forwarding    = "VRF_3"
      admin_status = false
    }
  ]
}

# List of string VRF Variable 
variable "vrfs" {
  type    = list(string)
  default = ["VRF_1", "VRF_2", "VRF_3"]
}

# List of number VLAN Variable 
variable "vlan_ids" {
  type    = list(number)
  default = [10, 20, 30]
}

