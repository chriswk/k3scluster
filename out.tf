output hcloud_network {
  value = hcloud_network.kube.name
}

output hcloud_floating_ip {
  value = var.enable_servicelb ? hcloud_floating_ip.master[0].ip_address : ""
}

output hcloud_subnet_cidr {
  value = hcloud_network_subnet.kube_subnet.ip_range
}

output hcloud_master_ip {
  value = hcloud_server.master.ipv4_address
}
