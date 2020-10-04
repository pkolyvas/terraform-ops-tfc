data "tfe_workspace" "tfc-admin" {
  name         = "tfc-admin"
  organization = var.organization_name
}

# The workspace within which this config exists
resource "tfe_workspace" "admin_workspace" {
  name              = "admin_workspace"
  organization      = var.organization_name
  terraform_version = "0.13.4"
  working_directory = "infra/tfc-admin"
  vcs_repo {
    identifier     = "lceeq/virtual-conference"
    branch         = "main"
    oauth_token_id = "ot-MsKBgW2tXZ4qyT92"
  }
}

resource "tfe_organization_token" "admin_token" {
  organization = var.organization_name
}


resource "tfe_variable" "admin_token" {
  key          = "TFE_TOKEN"
  value        = tfe_organization_token.admin_token.token
  category     = "env"
  workspace_id = data.tfe_workspace.tfc-admin.id
  description  = "The TFE Token"
  sensitive    = true
}

resource "tfe_variable" "aws_access_key_id" {
  key          = "TF_VAR_AWS_ACCESS_KEY_ID"
  value        = var.AWS_ACCESS_KEY_ID
  category     = "env"
  workspace_id = data.tfe_workspace.tfc-admin.id
  description  = "AWS Access Key ID"
  sensitive    = true
}

resource "tfe_variable" "aws_secret_key" {
  key          = "TF_VAR_AWS_SECRET_KEY"
  value        = var.AWS_SECRET_KEY
  category     = "env"
  workspace_id = data.tfe_workspace.tfc-admin.id
  description  = "AWS Access Key ID"
  sensitive    = true
}
