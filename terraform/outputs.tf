output "workloads_folder_id" {
  description = "Workloads folder resource name"
  value       = google_folder.workloads.name
}

output "shared_folder_id" {
  description = "Shared folder resource name"
  value       = google_folder.shared.name
}

output "shared_vpc_host_project" {
  description = "Shared VPC host project"
  value       = google_compute_shared_vpc_host_project.host.project
}
