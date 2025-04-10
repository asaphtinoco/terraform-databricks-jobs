#####################################################################################################################################################################
## VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES #### VARIABLES ##
#####################################################################################################################################################################

# Databricks workspace URL used for authentication and API calls
variable "databricks_workspace_url" {
  type        = string
  description = "The URL of your Databricks workspace (e.g., https://<your-databricks-instance>.databricks.com). This is used for connecting to Databricks via the API."
}

# Databricks account username for authentication
variable "databricks_account_username" {
  type        = string
  description = "The username of your Databricks account. This is used for authentication when accessing the Databricks workspace."
}

# Databricks account password for authentication
variable "databricks_account_password" {
  type        = string
  description = "The password associated with your Databricks account. This is used in combination with the username for authentication."
}

# List of email addresses to notify in case the job fails
variable "on_failure_alert_email" {
  type        = list(string)
  description = "A list of email addresses to be alerted whenever the job fails. These emails will receive failure notifications."
}