variable "region" {
  default = "europe-west2"
  type    = "string"
}

variable "region_zone" {
  default = "europe-west2-a"
  type    = "string"
}

variable host_project_id {
  description = "Project ID for the host project."
  type        = "string"
}

# Service Projects
variable "service_project_ids" {
  type        = "list"
  description = "List of associated service projects to link with the host project."
}

# APIs to be enabled on service projects
variable project_services {
  description = "List of host project services to enable."
  type        = "list"

  default = [
    "compute.googleapis.com",
    "container.googleapis.com",
  ]
}

variable shared_vpc_name {
  type = "string"
}

variable "gke_pod_network_name" {
  type = "string"
}

variable "gke_service_network_name" {
  type = "string"
}

# path to shared vpc service account credentials file
variable standard_network_subnets {
  type = "map"
}

variable gke_node_network_subnets {
  type = "map"
}

variable gke_pod_network_subnets {
  type = "map"
}

variable gke_service_network_subnets {
  type = "map"
}

variable router_nat_name {
  type = "string"
}

variable router_name {
  type = "string"
}

variable create_nat_gateway {
  type    = "string"
  default = "true"
}
