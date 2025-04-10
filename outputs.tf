output "databricks_job_id" {
  description = "The ID of the Databricks job created by this module."
  value       = databricks_job.this.id
}

output "databricks_job_name" {
  description = "The name of the Databricks job."
  value       = databricks_job.this.name
}

output "notebook_paths" {
  description = "The paths of the notebooks deployed in Databricks."
  value       = [for nb in databricks_notebook.this : nb.path]
}

