variable "key" {}
variable "publickey" {}
variable "location" {}
variable "image" {}

variable "network_name" {}
variable "network_range" {}
variable "network_subnet" {}
variable "hcloud_token" {}
variable "leader_name" {}
variable "leader_type" {}
variable "leader_ip" {}

variable "node_name_format" {}
variable "node_type" {}
variable "node_count" {}

variable "enable_servicelb" {
  default = true
}

variable "enable_hlb" {
  default = false
}

