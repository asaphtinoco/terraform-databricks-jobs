#########################################################
## Providers definitions for all AWS regions supported ##
#########################################################

provider "databricks" {
  alias         = "workspace"
  host          = data.terraform_remote_state.zepz_data_dev_prerequisites.outputs["databricks_workspace_url"]
  client_id     = data.aws_ssm_parameter.databricks_account_username.value
  client_secret = data.aws_ssm_parameter.databricks_account_password.value
}
