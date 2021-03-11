workspaces = {
  # This object will generate a workspace titled "example_workspace"
  # using the defaults of TFC. Please see below for other examples.
  # Additionally, each workspace will be created with AWS credentials defined
  # from the Admin/source workspace.
  example_workspace = {}
}

# More examples
#
# workspaces = {
#   a_specific_version = {
#     terraform_version = "0.14.5"
#   }
# }
#
# In the above example, we use the optional "terraform_version" attribute to select
# a specific version of Terraform. Any of the optional attributes can be sepecified 
# in the named workspaces objects, and they reflect the names of the attributes 
# expected by the TFE provider for the workspace resource.

# Creating many workspaces is easy.
# workspaces = {
#   one = {}
#   two = {}
#   three = {}
# }




organization_name  = "your-org-name"
organization_email = "your-org-mail@example.com"
