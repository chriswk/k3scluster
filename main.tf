terraform {
  backend "remote" {
    organization = "chriswk"

    workspaces {
      name = "hcloud-k8s"
    }
  }
}

resource "hcloud_ssh_key" "key" {
  name       = var.key
  public_key = file(var.cert)
}

resource "hcloud_network" "kube" {
  name     = var.network_name
  ip_range = var.network_range
}

resource "hcloud_network_subnet" "kube_subnet" {
  network_id   = hcloud_network.kube.network_id
  ip_range     = var.hcloud_network_subnet
  type         = "server"
  network_zone = "eu-central"
}
