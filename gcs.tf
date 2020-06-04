resource "google_storage_bucket" "iac_infrastructure" {
  name = "iac-infrastructure"
  location = "US"


  versioning {
    enabled = true
  }
}