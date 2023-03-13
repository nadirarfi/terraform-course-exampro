Terraform is an open-source and cloud-agnostic IaC tool:
  Uses Declarative configuration files (written in HashiCorp Configuration Language HCL)
  Installable modules
  Plan and predict changes
  Dependency graphing
  State management
  Provision Infrastructure in familiar languages
  Terraform Registry with 1000+ providers


Terraform Cloud (SaaS offering):
  Remote state storage
  Version Control Integrations
  Flexible workflows
  Collaborate on Infrastructure changes in a single unified web portal


Terraform Lifecycle:
  Write or update Terraform configuration file
  Initialise project (pull latest providers and modules)
  Plan (speculate changes or generate a saved execution plan)
  Validate (ensure types and values are valid etc...)
  Apply (execute the plan provisioning infrastucture)
  Destroy remote infrastructure


Change Management & Automation:
  Automatically create a consistent, systematic and predictable way of managing change request via controls and policies
  Executions Plans and Resources graphs are to used to apply/review complex changesets
  Changesets are collections of commits that represent changes made to a versioning repository


Execution Plans:
  Manual review of what will be added, changed or destroyed before changes are even applied
  Terraform graph command can be used to visualise an execution plan (GraphViz must be installed as well)
  An execution plan is represented by a dependency graph generated from Terraform configurations 


Terraform is logically split into two main parts:
  1. Terraform Core uses remote procedure calls (RPC) to communicate with Terraform Plugins
  2. Terraform Plugins expose an implementation for a specific service/provisioner

