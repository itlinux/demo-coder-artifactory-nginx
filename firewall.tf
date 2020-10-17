
resource "google_compute_firewall" "vpc_network" {
  name    = "remo-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22", "8443", "8082"]
  }

  source_tags = ["remo-home"]
  source_ranges = ["172.10.163.251/32"]
}
