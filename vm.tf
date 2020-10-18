resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type_selected

  boot_disk {
    initialize_params {
      image = var.linux_image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "null_resource" "docker_install" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.priv_sshkey)
      host        = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
      agent       = false
    }

    inline = [
      "sudo curl -sSL https://get.docker.com/ | sh",
      "sudo usermod -aG docker `echo $USER`",
      "sudo systemctl --now enable docker",
      "sudo docker run -d -p 80:80 nginx"
    ]
  }
  depends_on = [google_compute_instance.vm_instance]
}
