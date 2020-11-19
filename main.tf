terraform {
  backend "remote" {
    organization = "chriswk"

    workspaces {
      name = "hcloud-k8s"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "key" {
  name       = var.key
  public_key = var.publickey
}

resource "hcloud_network" "kube" {
  name     = var.network_name
  ip_range = var.network_range
}

resource "hcloud_network_subnet" "kube_subnet" {
  network_id   = hcloud_network.kube.id
  ip_range     = var.network_subnet
  type         = "server"
  network_zone = "eu-central"
}
