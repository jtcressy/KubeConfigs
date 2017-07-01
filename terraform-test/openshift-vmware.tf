# SET YOUR VCENTER CONNECTION INFORMATION HERE
provider "vsphere" {
  user           = "jtcressy"
  password       = "Lifehidebirthsky"
  vsphere_server = "vcenter.jtcressy.net"
  allow_unverified_ssl = "true"
}

# DEFINE YOUR RESOURCES HERE FOLLOWING THIS TEMPLATE, REPLACING VALUES AS REQUIRED
resource "vsphere_virtual_machine" "test" {
  name   = "test"
  folder = ""
  datacenter = "Home"
  vcpu   = 4
  memory = 4096
  domain = "home.jtcressy.net"
  cluster = "blackbox.home.jtcressy.net"
  resource_pool = "blackbox.home.jtcressy.net"
  dns_suffixes = ["home.jtcressy.net"]
  dns_servers = ["192.168.20.10"]

  network_interface {
    label = "jtcressy.net"
    ipv4_address = "192.168.20.254"
    ipv4_prefix_length = "24"
    ipv4_gateway = "192.168.20.1"
  }

  network_interface {
    label = "SAN"
    ipv4_address = "192.168.51.254"
    ipv4_prefix_length = "24"
    ipv4_gateway = "192.168.51.1"
  }

  disk {
    template = "xenial-server-cloudimg-amd64.ova"
    datastore = "VMwareMachines-iscsi"
    type = "thin"
  }
}
