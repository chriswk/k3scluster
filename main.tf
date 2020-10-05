terraform {
  backend "remote" {
    organization = "chriswk"

    workspaces {
      name = "hcloud-k8s"
    }
  }
}
