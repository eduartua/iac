resource "google_compute_firewall" "webserver_firewall" {
  name    = "webserver-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = [var.port]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["webserver"]
}
