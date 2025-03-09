terraform {
  cloud {
    organization = "#{HCP_TF_ORG_NAME}#"
    hostname     = "#{HCP_TF_HOSTNAME}#"

    workspaces {
      project = "#{HCP_TF_PROJECT_NAME}#"

      tags = {
        layer  = "#{HCP_TF_WORKSPACE_NAME}#"
        source = "cli"
      }
    }
  }
}
