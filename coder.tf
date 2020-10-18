resource "null_resource" "coder" {
   provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "r.mattei"
      private_key = file("~/.ssh/gcpf5")
      host        = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
      agent       = false
    }

    inline = [
    "sudo mkdir -p /coderconfig",
    "sudo groupadd coder",
    "sudo chown -R r.mattei:r.mattei /coderconfig",
    "sudo usermod -aG coder `echo $USER`",
    "docker run -d --name=code-server -e PASSWORD=f5admin -p 8080:8080 -v /coderconfig:/config --restart unless-stopped codercom/code-server:3.6.0 --cert",
    "docker exec -it code-server sudo apt update",
    "docker exec -it code-server sudo apt install unzip",
    "docker exec -it code-server curl -fOL https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip",
    "docker exec -it code-server sudo unzip terraform_0.13.4_linux_amd64.zip -d /usr/local/bin/",
    "docker exec -it code-server rm terraform_0.13.4_linux_amd64.zip",
    "docker exec -it code-server code-server --extensions-dir  /config/extensions --install-extension hashicorp.terraform",
    "docker exec -it code-server code-server --extensions-dir  /config/extensions --install-extension donjayamanne.githistory",
    "docker exec -it code-server curl -o /tmp/linux-prereqs.sh https://raw.githubusercontent.com/MicrosoftDocs/live-share/master/scripts/linux-prereqs.sh",
    "docker exec -it code-server sh /tmp/linux-prereqs.sh",
    "docker stop code-server && sleep 15 && docker start code-server"
    ]
  }
  depends_on = [google_compute_instance.vm_instance, null_resource.docker_install]
 }
