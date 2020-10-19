provider "google" {
  project     = var.projectid
  region      = var.region
  zone        = var.zone
  credentials = file(var.creds)
}
