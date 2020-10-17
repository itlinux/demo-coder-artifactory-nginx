provider "google" {
  project = "f5-gcs-4261-sales-na-w"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = file("../gcp-creds/f5 GCS 4261 SALES NA W-6bf11d2623a9.json")
}
