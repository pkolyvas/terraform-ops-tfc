module "tfe_admin" {
  source            = "./admin/"
  organization_name = var.organization_name
  AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_KEY    = var.AWS_SECRET_KEY
}

resource "tfe_workspace" "workspaces" {
  for_each = var.workspaces

  name         = each.key
  organization = var.organization_name

  operations        = each.value["operations"]
  terraform_version = each.value["terraform_version"]
  queue_all_runs    = each.value["queue_all_runs"]
  working_directory = each.value["working_directory"]
  vcs_repo {
    identifier     = each.value["vcs_identifier"]
    branch         = each.value["vcs_branch"]
    oauth_token_id = each.value["vcs_oauth_token_id"]
  }
}

resource "tfe_variable" "aws_key" {
  for_each = var.workspaces

  workspace_id = tfe_workspace.workspaces[each.key].id
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.AWS_ACCESS_KEY_ID
  category     = "env"
  sensitive    = true
}

resource "tfe_variable" "aws_secret" {
  for_each = var.workspaces

  workspace_id = tfe_workspace.workspaces[each.key].id
  key          = "AWS_SECRET_KEY"
  value        = var.AWS_SECRET_KEY
  category     = "env"
  sensitive    = true
}


