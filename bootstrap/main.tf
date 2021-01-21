# The workspace within which this config exists
resource "tfe_workspace" "admin_workspace" {
  name              = "admin_workspace"
  organization      = var.organization_name
  working_directory = "ops-tfc/bootstrap"
  vcs_repo {
    identifier     = "pkolyvas/ops-tfc"
    branch         = "hippocorp"
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_organization_token" "tfc_admin_token" {
  organization = var.organization_name
}

resource "tfe_variable" "admin_token" {
  key          = "TFE_TOKEN"
  value        = tfe_organization_token.tfc_admin_token.token
  category     = "env"
  workspace_id = tfe_workspace.admin_workspace.id
  description  = "The TFE Token"
  sensitive    = true
}

resource "tfe_variable" "aws_access_key_id" {
  key          = "TF_VAR_AWS_ACCESS_KEY_ID"
  value        = var.AWS_ACCESS_KEY_ID
  category     = "env"
  workspace_id = tfe_workspace.admin_workspace.id
  description  = "AWS Access Key ID"
  sensitive    = true
}

resource "tfe_variable" "aws_secret_key" {
  key          = "TF_VAR_AWS_SECRET_ACCESS_KEY"
  value        = var.AWS_SECRET_ACCESS_KEY
  category     = "env"
  workspace_id = tfe_workspace.admin_workspace.id
  description  = "AWS Access Key ID"
  sensitive    = true
}



