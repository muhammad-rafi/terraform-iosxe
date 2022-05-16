# Username and password for the iosxe provider
username = "developer"
password = "C1sco12345"

# hostname for the device 
hostname = "csr1000v-devvars"

# List of Loopback interfaces
loopback_interfaces = [
  {
    name              = 400
    description       = "Created via terraform.tfvars"
    ipv4_address      = "10.0.4.10"
    ipv4_address_mask = "255.255.255.255"
    # vrf_forwarding    = "VRF_1"
    admin_status = false
  },
  {
    name              = 500
    description       = "Created via terraform.tfvars"
    ipv4_address      = "10.0.5.10"
    ipv4_address_mask = "255.255.255.255"
    # vrf_forwarding    = "VRF_2"
    admin_status = false
  },
  {
    name              = 600
    description       = "Created via terraform.tfvars"
    ipv4_address      = "10.0.6.10"
    ipv4_address_mask = "255.255.255.255"
    # vrf_forwarding    = "VRF_3"
    admin_status = false
  }
]

# List of VRFs 
vrfs = ["VRF_4", "VRF_5", "VRF_6"]

# List of VLANs
vlan_ids = [40, 50, 60]
