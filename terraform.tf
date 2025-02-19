terraform {
  cloud {
    organization = "#{hcp.tf.org.name}#"
    hostname     = "#{hcp.tf.hostname}#"

    workspaces {
      project = "#{hcp.tf.project.name}#"

      tags = {
        layer  = "#{hcp.tf.workspace.name}#"
        source = "cli"
      }
    }
  }
}
