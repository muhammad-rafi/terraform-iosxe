# Username and password for the iosxe provider
username = "developer"
password = "C1sco12345"

# hostname for the device 
hostname = "csr1000v-devvars"

# List of Loopback interfaces
loopback_interfaces = [
  {
    name              = 1000
    description       = "Created via dev.tfvars"
    ipv4_address      = "10.0.10.10"
    ipv4_address_mask = "255.255.255.255"
    # vrf_forwarding    = "VRF_10"
    admin_status = false
  },
  {
    name              = 1100
    description       = "Created via dev.tfvars"
    ipv4_address      = "10.0.11.10"
    ipv4_address_mask = "255.255.255.255"
    # vrf_forwarding    = "VRF_11"
    admin_status = false
  },
  {
    name              = 1200
    description       = "Created via dev.tfvars"
    ipv4_address      = "10.0.12.10"
    ipv4_address_mask = "255.255.255.255"
    # vrf_forwarding    = "VRF_12"
    admin_status = false
  }
]

# List of VRFs 
vrfs = ["VRF_10", "VRF_11", "VRF_12"]

# List of VLANs
vlan_ids = [100, 110, 120]
