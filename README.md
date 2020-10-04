# terraform-ops-tfc
A set of modules to help bootstrap &amp; operate TFC

This rough patchwork is the basic template I use to configure TFC. I use it to configure my workspaces with the necessary credentials and settings from the CLI, including their connections to specifc VCS repos.

A couple of premises worth sharing if you're poking around here for some usable code:
- This is AWS-centric
- The general pattern here assumes the same credentials are being used in the workspaces of an organization

Prerequisits:
- You'll need to have setup a TFC account
- You'll have to have setup a TFC organization
- You'll have to have configured that organization with a VCS connection
- I use `TF_VAR_AWS_ACCESS_KEY_ID` & `TF_VAR_AWS_SECRET_KEY` as the environment variables which allow me to populate the workspaces with the credentials I need.

General workflow:
- Configure these files as necessary
- `terraform login` to connect to TFC
- run a `terraform init` and `terraform apply` locally to configure "all the things"
- Uncomment the backend configuration in the `backend.tf` file
- Re-run `terraform init` move the state into TFC.
- Commit your files to VCS
- Profit?
