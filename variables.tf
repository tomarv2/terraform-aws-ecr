# Additional documentation: https://www.terraform.io/docs/configuration/variables.html
variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "email" {
  description = "email address to be used for tagging (suggestion: use group email address)"
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
  default     = "default"
}

variable "aws_region" {
  default = "us-west-2"
}

# Encryption type
variable "encryption_type" {
  description = "The encryption type to use for the repository. Valid values are `AES256` or `KMS`"
  type        = string
  default     = "AES256"
}

# KMS key
variable "kms_key" {
  description = "The ARN of the KMS key to use when encryption_type is `KMS`. If not specified when encryption_type is `KMS`, uses a new KMS key. Otherwise, uses the default AWS managed key for ECR."
  type        = string
  default     = null
}

# Lifecycle policy
variable "lifecycle_policy" {
  description = "Manages the ECR repository lifecycle policy"
  type        = string
  default     = null
}

# Image scanning configuration
variable "image_scanning_configuration" {
  description = "Configuration block that defines image scanning configuration for the repository. By default, image scanning must be manually triggered. See the ECR User Guide for more information about image scanning."
  type        = map(any)
  default     = {}
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  type        = bool
  default     = true
}

# Timeouts
variable "timeouts" {
  description = "Timeouts map."
  type        = map(any)
  default     = {}
}

variable "timeouts_delete" {
  description = "How long to wait for a repository to be deleted."
  type        = string
  default     = null
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`."
  type        = string
  default     = "IMMUTABLE"
}

variable "deploy_ecr" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

#
variable "dockerfile_folder" {
  type        = string
  description = "This is the folder which contains the Dockerfile"
}

//variable "docker_image_tag" {
//  type        = string
//  description = "This is the tag which will be used for the image that you created"
//  default     = random_string.naming.result
//}

variable "ecr_repository_url" {
  type        = string
  description = "Full url for the ecr repository"
}

variable "deploy_image" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}
