output "workloads_folder_id" {
  value = google_folder.workloads.name
}
output "shared_folder_id" {
  value = google_folder.shared.name
}
output "shared_vpc_host_project" {
  value = google_compute_shared_vpc_host_project.host.project
}
