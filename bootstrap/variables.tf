variable "organization_name" {
  type        = string
  description = "TFC Organization name"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS Secret Key"
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS Access Key ID"
}

variable "oauth_token_id" {
  type = string
  description = "VCS Oauth Token ID from TFC"
}
