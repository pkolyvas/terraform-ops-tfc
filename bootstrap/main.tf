terraform {
    required_providers {
        tfe = {
            source = "hashicorp/aws"
            version = "~> 0.24"
        }
    }
}

resource "tfe_workspace" "admin-workspace" {
    name = "admin-workspace"
    execution_mode = "local"
}

resource "tfe_variable" "aws_access_key_id" {
  key          = "TF_VAR_AWS_ACCESS_KEY_ID"
  value        = var.AWS_ACCESS_KEY_ID
  category     = "env"
  workspace_id = data.tfe_workspace.admin_workspace.id
  description  = "AWS Access Key ID"
  sensitive    = true
}

resource "tfe_variable" "aws_secret_key" {
  key          = "TF_VAR_AWS_SECRET_ACCESS_KEY"
  value        = var.AWS_SECRET_ACCESS_KEY
  category     = "env"
  workspace_id = data.tfe_workspace.admin_workspace.id
  description  = "AWS Secret Key ID"
  sensitive    = true
}