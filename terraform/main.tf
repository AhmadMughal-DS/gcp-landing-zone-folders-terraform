locals {
  name_prefix = var.project_name
}

module "landingzone" {
  source             = "./modules/landingzone"
  name_prefix        = local.name_prefix
  org_id             = var.org_id
  host_project_id    = var.host_project_id
  service_project_id = var.service_project_id
  environment        = var.environment
}
