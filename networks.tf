resource "google_compute_network" "vpc_network" {
  name                    = "remo-terraform"
  auto_create_subnetworks = "true"
}
