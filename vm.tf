resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type_selected

  boot_disk {
    initialize_params {
      image = var.linux_image
    }
  }
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_file)}"
  }
  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}
