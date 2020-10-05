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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/kg8GmYTNFHbea22+2sl3gayQRFVuuqbjqvROrSae67DjOszvJzrY9W/rsm3dsCxqcWSSLJZhXuWorvXXGMl0y1VJpsDMr9ui4qupZTu9nJHZbHqNdKKBIXHABTy5i+Z3sy3upJiQDs9aVbu5v8tYc0fmwgnZe9+V957mS6LIbGDltbITss/zUZmqhyRO9IAwjR08YE3ZB+6M6LOBD1O+4Jr8mvl9JiKkjZnPY+FtG7RX4OcL084h7YLZY9EdoHW8+qEpCJu9FRiUaPtncr9e0JpMxKEK5KXkUj8ICu50k1ilydX2rdrPNowEDvk2zdhuQxw3GsF4hiYRZJGjs9FXOzW6O9f5NjdtGWMY2ncNwIqQPmvfO2VfBNaX7/VynUI9QtE+2j+JNHCAKducqFKss0vDYH3J8gL3Lp4AAWcHFWLu6OXPryGBIV9mneBX5jNYixYaX1bGyHIjGNONaTWV28JPwUs1kuUMTkpvdjsNBO+o2Sp2TT5R9EGaod4TePvc2RVVW3c7zRIfCOCYASWnKgjb4yD8A6kuLdMMkybUpeQsVbM+S34fQOsEbUSENxrJlM+L5FbKIMGUBGB+Q3frPzYArBjwByLZuBBtYJf9BT70exD4gLqoMRaieqNHYIbOmCYi+1ZHQ5n9MZvpbxHzujdZwRjNxsEVGvWTk3mw5w== terraform"
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
