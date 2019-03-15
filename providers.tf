terraform {
  required_version = "0.11.11"
}

provider "google" {
  version = "2.1"

  project = "${var.host_project_id}"
  region  = "${var.region}"
  zone    = "${var.region_zone}"
}
