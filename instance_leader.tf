resource "hcloud_server" "leader" {
  depends_on = [
    hcloud_network_subnet.kube_subnet,
  ]

  name        = var.leader_name
  server_type = var.master_type
  image       = var.image
  location    = var.location
  user_data = templatefile("files/cloud_config.yml", {
    key = hcloud_ssh_key.key.public_key
  })

}

resource "hcloud_server_network" "leader" {
  server_id = hcloud_server.leader.id
  subnet_id = hcloud_network_subnet.kube_subnet.id
  ip        = var.leader_ip
}

resource "hcloud_floating_ip" "leader" {
  type      = "ipv4"
  server_id = hcloud_server.leader.id
  count     = var.enable_servicelb ? 1 : 0
}

resource "null_resource" "leader" {
  depends_on = [
    hcloud_server.leader,
    hcloud_server_network.leader,
    hcloud_floating_ip.leader,
  ]
}
