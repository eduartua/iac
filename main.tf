provider "google" {
  project = var.project
  region = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "iac-infrastructure"
    prefix  = "terraform/terraform.state"
  }
}
