output "webserver_ip_address" {
  description = "Webserver instance IP adress."
  value = google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip
}