resource "google_compute_router" "router" {
  name    = "${var.router_name}"
  region  = "${var.region}"
  network = "${google_compute_network.shared_network.self_link}"
}

resource "google_compute_router_nat" "simple-nat" {
  count                              = "${var.create_nat_gateway  == "true" ? 1 : 0}"
  name                               = "${var.router_nat_name}"
  router                             = "${google_compute_router.router.name}"
  region                             = "${var.region}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
