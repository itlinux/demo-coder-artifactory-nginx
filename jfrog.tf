resource "null_resource" "jfrog" {
   provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file("~/.ssh/gcpf5")
      host        = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
      agent       = false
    }

    inline = [
    "sudo mkdir -p /jfrog/artifactory",
    "sudo chown -R 1030 /jfrog ",
    "docker run --name artifactory -d -p 8082:8081 -v /jfrog/artifactory:/var/opt/jfrog/artifactory docker.bintray.io/jfrog/artifactory-oss:6.21.0"
    ]
  }
  depends_on = [google_compute_instance.vm_instance, null_resource.docker_install]
 }
