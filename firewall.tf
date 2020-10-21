
resource "google_compute_firewall" "vpc_network" {
  name    = var.firewall_name
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22", "8443", "8082"]
  }
  source_tags   = [var.source_tags]
  source_ranges = [for v, k in var.allowed_ips : k if k != "all"]
}
