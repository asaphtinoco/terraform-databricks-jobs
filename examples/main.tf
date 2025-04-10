module "name" {
  providers = {
    databricks.workspace = databricks.workspace
  }
  source                     = ".."
  databricks_job_description = "Job dedicated to run linked accounts"
  databricks_job_name        = "linked_account"
  cluster_name               = "analytics_cluster"
  file_path = [
    abspath("${path.module}/query_1.sql"),
    abspath("${path.module}/query_2.sql"),
    abspath("${path.module}/query_3.sql")
  ]
  team_owner             = "analytcs"
  user_email             = "anything@anything.com"
  environment            = "dev"
  spark_version          = "3.5.0"
  node_type_id           = data.databricks_node_type.node_memory_photon_large.id
  on_failure_alert_email = var.on_failure_alert_email
}