# GCP Secure Landing Zone (Terraform)

> Foundational governance on Google Cloud: a folder hierarchy, organization-policy guardrails, and Shared VPC — provisioned with Terraform.
> **Author:** Muhammad Ahmad · **IaC:** Terraform · **Cloud:** GCP

![Terraform](https://img.shields.io/badge/Terraform-1.5%2B-7B42BC?logo=terraform&logoColor=white)
![GCP](https://img.shields.io/badge/GCP-Folders%20%7C%20Org%20Policy%20%7C%20Shared%20VPC-4285F4?logo=googlecloud&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📌 Overview

- A **folder hierarchy** (`workloads` → `shared`) to group projects by purpose.
- **Organization policies** on the workloads folder: disable service-account key creation and restrict resource locations to the US.
- **Shared VPC** — a host project shares its network with a service project, centralizing networking.

The governance baseline you lay down before onboarding workload projects.

## 🏗️ Architecture

> 🎨 **Interactive diagram (industry-standard icons):** [open in Lucid — page 28](https://lucid.app/lucidchart/3da75ce3-ea66-4296-81b3-00d20a60435b/edit)

```mermaid
flowchart TB
    Org[Organization]
    WF[Workloads Folder]
    SF[Shared Folder]
    Pol[Org Policies]
    Host[Shared VPC Host Project]
    Svc[Service Project]

    Org --> WF
    WF --> SF
    Pol -.enforced.-> WF
    Host -->|shares network| Svc
```

## ⚠️ Prerequisites

Run with an identity that has **Organization Policy Administrator**, **Folder Admin**, and **Compute Shared VPC Admin**. Set `org_id`, `host_project_id`, and `service_project_id`.

## 🚀 Deploy

```bash
cd terraform
gcloud auth application-default login
terraform init
terraform apply \
  -var="org_id=YOUR_ORG_ID" \
  -var="host_project_id=HOST_PROJECT" \
  -var="service_project_id=SERVICE_PROJECT"
```

## 🧹 Clean up

```bash
terraform destroy
```

## 🔐 Production hardening (next steps)

- Add a full folder tree (prod / non-prod / sandbox) with per-folder policies.
- Add **VPC Service Controls** perimeters.
- Centralize **logging** to a dedicated project sink.

---

*Built and maintained by **Muhammad Ahmad**.*
