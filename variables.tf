variable "ssh_user" {
  default = "r.mattei"
}
variable "passwd" {
  default = "f5admin"
}
variable "username" {
  default = "A1Workshop"
}
variable "user_email" {
  default = "nobody@example.com"
}
variable "network_name" {
  default = "remo-terraform"
}
variable "auto_create_network" {
  default = "true"
}
variable "instance_name" {
  default = "remo-test-tf-instance"
}
variable "machine_type_selected" {
  default = "c2-standard-8"
}
variable "linux_image" {
  default = "centos-cloud/centos-7"
}
variable "firewall_name" {
  default = "remo-firewall"
}
variable "source_tags" {
  default = "remo-home"
}
variable "allowed_ips" {
  default = "172.10.163.251/32"
}
variable "priv_sshkey" {
  default = "~/.ssh/gcpf5"
}
