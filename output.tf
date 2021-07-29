output public_ip {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}

output coder_password {
  value = random_string.coder-password.result
}
