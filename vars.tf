variable "key" {}
variable "cert" {}
variable "location" {}
variable "image" {}

variable "network_name" {}
variable "network_range" {}
variable "network_subnet" {}

variable "master_name" {}
variable "master_type" {}
variable "master_ip" {}

variable "node_name_format" {}
variable "node_type" {}
variable "node_count" {}

variable "enable_servicelb" {
  default = true
}

variable "enable_hlb" {
  default = false
}

