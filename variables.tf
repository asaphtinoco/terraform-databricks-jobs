##########################################################################################
## VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES ##
##########################################################################################

# Terraform configuration section

variable "databricks_job_name" {
  type        = string
  description = "The name displayed for the Databricks job in the UI."
}

variable "databricks_job_description" {
  type        = string
  description = "A brief description of the Databricks job to provide context or purpose."
}

variable "cluster_name" {
  type        = string
  description = "The name assigned to the Databricks cluster for identification."
}

variable "file_path" {
  type        = list(string)
  description = "The path or list of paths to the files or notebooks to be executed in the job."
}

variable "environment" {
  type        = string
  description = "The environment where the job will be deployed (e.g., dev, staging, production)."
  validation {
    condition     = contains(["prd", "dev", "ppd", "tst"], var.environment)
    error_message = "The environment must be one of the following: prd, dev, ppd, or tst."
  }
}

variable "team_owner" {
  type        = string
  description = "The team responsible for managing the Databricks cluster."
}

variable "user_email" {
  type        = string
  description = "The user responsible for the job; this is the point of contact for any issues."
}

variable "service_principal_id" {
  type        = string
  description = "Service Principal ID"
  default     = null
}

variable "spark_version" {
  type        = string
  description = "The Databricks Runtime version to be used for the Spark job (e.g., 13.3.x-scala2.12)."
}

variable "node_type_id" {
  description = "The type of EC2 instance to use for the Databricks cluster nodes (e.g., i3.xlarge, m5d.large)."
}

variable "on_failure_alert_email" {
  type        = list(string)
  description = "A list of email addresses to notify when the job fails."
}

variable "databricks_notebook_path" {
  type        = string
  description = "The full path in Databricks where the notebook will be stored. This should include the workspace directory structure (e.g., '/Workspace/Team/Project/Notebook')."
}
