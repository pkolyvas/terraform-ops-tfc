variable "organization_name" {
  type        = string
  description = "TFC Organization name"
}

variable "organization_email" {
  type        = string
  description = "TFC Organization email"
}

variable "workspaces" {
  type = map(object({
    operations         = bool
    terraform_version  = string
    queue_all_runs     = bool
    vcs_identifier     = string
    vcs_branch         = string
    vcs_oauth_token_id = string
    working_directory  = string
  }))
}

variable "AWS_SECRET_KEY" {
  type        = string
  description = "AWS Secret Key"
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS Access Key ID"
}


