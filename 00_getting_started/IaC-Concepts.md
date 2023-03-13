Manual configuration of cloud infrastructure:
  Easy to misconfigure (human error)
  Hard to manage the expected state (compliance)
  Difficult to transfer configuration knowledge to other team members

Infrastructure as Code (IaC):
  Configuration script that automates creating, updating or destroying infrastructure
  Considered as a blueprint of the infrastructure
  Share, version or inventory
  Changes are idempotent, consistent, repeatable and predictable
  Idempotent means no matter how many times the script is run, the same state is always rendered

Imperative IaC:
  Less verbose, more likely to have misconfigurations
  Uses programming languages e.g. Python, Ruby, JavaScript
  AWS CDK, Pulumi

Declarative IaC:
  Explicit (you get what you see)
  More verbose but zero chance of mis-configuration
  Uses scripting languages e.g. JSON, YAML
  Azure Blueprints, CloudFormation, Cloud Deployment Manager, Terraform



Infrastructure Lifecycle:
Number of clearly defined/distinct work phases used by DevOps Engineers
  Plan and design
  Build and test
  Deliver and maintain 
  Retire/destroy 


Provisioning vs Deployment vs Orchestration:
Provisioning is the act of launching a cloud service and configure it.
  Prepare a server with systems, data and software
  Make it ready for network operation
  Use configuration management tools like Puppet, Ansible etc...

Deployment is act of delivering a version of your application to run a provisioned server
  Deployment could be thruogh AWS CodePipline, Jenkins, Github Actions etc...

Orchestration is the act of coordinating multiple systems/services (microservices, containers etc...)
  Use tools like Kubernetes, Salt, Fabric...


Configuration Drift:
  Provisioned infrastructure has an unexpected configuration change
  Can be detected and corrected with a compliance tool e.g. AWS Config or Built-in support tools such as AWS CloudFormation Drift Detection
  Storing the expected state e.g. Terraform state files

Prevent Configuration Drift:
  Using GitOps to version control IaC
  Immutable infrastructure (create, destroy, never reuse)


Mutable vs Immutable Infrastructure:
Mutable (develop, deploy, configure)
  VM is deployed then a configuration management tool is used to configure state of the server

Immutable (develop, configure, deploy):
  VM is launched and provisioned, then it is turned into a Virtual Image, stored in image repository,
then used to deployed VM instances




Problems faced:
  Cloud Resource Failure
  Application Failure
  Time to Deploy 
  Accidental deletion
  Compromised by malicious actors
  Region outage
