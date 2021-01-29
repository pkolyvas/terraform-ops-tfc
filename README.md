# [WIP] terraform-ops-tfc
A set of modules to help bootstrap &amp; operate TFC

This rough patchwork is the basic template I use to configure TFC. I use it to configure my workspaces with the necessary credentials and settings from the CLI, including their connections to specifc VCS repos.

A couple of premises worth sharing if you're poking around here for some usable code:
- This is AWS-centric
- The general pattern here assumes the same credentials are being used in the workspaces of an organization, like a service account. 

Prerequisites:
- TFC account
- A TFC organization
- (Optionally, but helpful) VCS connection configured

NB. I use `TF_VAR_AWS_ACCESS_KEY_ID` & `TF_VAR_AWS_SECRET_KEY`, in the administrative workspace, as the environment variables which allow me to populate the workspaces with the credentials I need.
