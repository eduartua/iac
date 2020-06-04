resource "google_compute_instance" "webserver" {
  machine_type = "n1-standard-2"
  zone = "us-central1-c"
  name = "webserver2"
  tags = [
    "webserver",
  ]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network       = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.port} &
              EOF

  lifecycle {
    create_before_destroy = true

    ignore_changes = [
      metadata_startup_script,
      machine_type,
    ]
  }
}