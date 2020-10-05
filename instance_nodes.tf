resource "hcloud_server" "node" {
  depends_on = [
    hcloud_network_subnet.kube_subnet,
    hcloud_server.leader,
  ]

  name        = format(var.node_name_format, count.index + 1)
  server_type = var.node_type
  image       = var.image
  location    = var.location
  user_data = templatefile("files/cloud_config.yml", {
    key = hcloud_ssh_key.key.public_key
  })
  count = var.node_count
}

resource "hcloud_server_network" "node" {
  server_id = hcloud_server.node[count.index].id
  subnet_id = hcloud_network_subnet.kube_subnet.id
  count     = var.node_count
}

resource "null_resource" "node" {
  depends_on = [
    hcloud_server.node,
    hcloud_server_network.node
  ]
}
