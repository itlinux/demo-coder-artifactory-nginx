resource "google_compute_instance" "vm_instance" {
  name         = "remo-test-tf-instance"
  machine_type = "c2-standard-8"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
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
      user        = "r.mattei"
      private_key = file("~/.ssh/gcpf5")
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