# Create the hosted network.
resource "google_compute_network" "shared_network" {
  name                    = "${var.shared_vpc_name}"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
  project                 = "${var.host_project_id}"

  #depends_on = ["google_project_services.host_project"]
}

# Create single subnet networks
resource "google_compute_subnetwork" "standard" {
  count         = "${length(var.standard_network_subnets)}"
  name          = "${element(keys(var.standard_network_subnets), count.index)}"
  ip_cidr_range = "${lookup(var.standard_network_subnets, element(keys(var.standard_network_subnets), count.index))}"
  region        = "${var.region}"
  project       = "${var.host_project_id}"
  network       = "${google_compute_network.shared_network.self_link}"

  #depends_on    = ["google_project_services.host_project"]
}

resource "google_compute_subnetwork" "gke" {
  count         = "${length(var.gke_node_network_subnets)}"
  name          = "${element(keys(var.gke_node_network_subnets), count.index)}"
  ip_cidr_range = "${lookup(var.gke_node_network_subnets, element(keys(var.gke_node_network_subnets), count.index))}"
  region        = "${var.region}"
  project       = "${var.host_project_id}"
  network       = "${google_compute_network.shared_network.self_link}"

  # Kubernetes Secondary Networking
  secondary_ip_range {
    range_name    = "${var.gke_pod_network_name}"
    ip_cidr_range = "${lookup(var.gke_pod_network_subnets, element(keys(var.gke_node_network_subnets), count.index))}"
  }

  secondary_ip_range {
    range_name    = "${var.gke_service_network_name}"
    ip_cidr_range = "${lookup(var.gke_service_network_subnets, element(keys(var.gke_node_network_subnets), count.index))}"
  }

  #depends_on = ["google_project_services.host_project"]
}
