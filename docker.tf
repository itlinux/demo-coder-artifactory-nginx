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
