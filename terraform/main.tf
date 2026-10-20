locals {
  name = var.project_name
}

############################
# Folder hierarchy
############################
resource "google_folder" "workloads" {
  display_name = "${local.name}-workloads"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "shared" {
  display_name = "${local.name}-shared"
  parent       = google_folder.workloads.name
}

############################
# Organization policy (guardrail) on the workloads folder
############################
resource "google_folder_organization_policy" "disable_sa_keys" {
  folder     = google_folder.workloads.name
  constraint = "iam.disableServiceAccountKeyCreation"

  boolean_policy {
    enforced = true
  }
}

resource "google_folder_organization_policy" "restrict_locations" {
  folder     = google_folder.workloads.name
  constraint = "gcp.resourceLocations"

  list_policy {
    allow {
      values = ["in:us-locations"]
    }
  }
}

############################
# Shared VPC
############################
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.host_project_id
}

resource "google_compute_shared_vpc_service_project" "service" {
  host_project    = var.host_project_id
  service_project = var.service_project_id

  depends_on = [google_compute_shared_vpc_host_project.host]
}
