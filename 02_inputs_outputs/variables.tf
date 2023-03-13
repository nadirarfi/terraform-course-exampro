variable "INSTANCE_AMI" {
  type        = string
  description = "Instance AMI id"

}


variable "INSTANCE_TYPE" {
  type        = string
  description = "Instance Type"
  validation {
    condition     = can(regex("^t2.", var.INSTANCE_TYPE))
    error_message = "The instance must be a t2 type EC2 instance."
  }
}