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
        type = map
        default = {
                ip1= "166.70.92.176/32"
                ip2= "172.10.163.251"
        }
}
variable "priv_sshkey" {
  default = "~/.ssh/gcpf5"
}
variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-c"
}
variable "projectid" {
  default = "f5-gcs-4261-sales-na-w"
}
variable "creds" {
  default = "../gcp-creds/f5 GCS 4261 SALES NA W-6bf11d2623a9.json"
}
