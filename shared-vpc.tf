# Enable shared VPC in the service projects - explicitly depend on the host
# project enabling it, because enabling shared VPC will fail if the host project
# is not yet hosting.

resource "google_compute_shared_vpc_host_project" "host" {
  project = "${var.host_project_id}"
}

resource "google_compute_shared_vpc_service_project" "service" {
  count = "${length(var.service_project_ids)}"

  host_project    = "${google_compute_shared_vpc_host_project.host.project}"
  service_project = "${element(var.service_project_ids, count.index)}"
}
