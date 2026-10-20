variable "org_id" {
  description = "GCP organization ID"
  type        = string
  default     = "123456789012"
}

variable "host_project_id" {
  description = "Shared VPC host project ID"
  type        = string
  default     = "your-host-project-id"
}

variable "service_project_id" {
  description = "Shared VPC service project ID"
  type        = string
  default     = "your-service-project-id"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "project_name" {
  description = "Name prefix applied to folders"
  type        = string
  default     = "ahmad-lz"
}
