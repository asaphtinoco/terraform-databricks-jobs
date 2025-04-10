# terraform-databricks-jobs
A Terraform module for provisioning and managing Databricks jobs. It supports custom clusters, multiple notebook tasks, job tagging, and email notifications on failure. Ideal for automating data processing, analytics, and orchestration workflows in Databricks environments.

# Terraform Databricks Jobs Module

This Terraform module automates the creation of Databricks jobs, managing multiple notebook tasks within a custom cluster. The module allows flexible configurations, including email alerts, custom cluster settings, and job descriptions.

---

## 🛠 Usage

To use this module, you can reference it as follows in your Terraform configuration:

```hcl
module "linked_accounts_job" {
  providers = {
    databricks.workspace = databricks.workspace
  }
  source                   = "./module"
  job_description          = "Job dedicated to run linked accounts"
  job_name                 = "linked_account"
  cluster_identifier       = "analytics_cluster"
  notebook_paths = [
    abspath("${path.module}/query1.sql"),
    abspath("${path.module}/query2.sql"),
    abspath("${path.module}/query3.sql")
  ]
  responsible_team         = "analytics"
  contact_email            = "anything@anything.com"
  deployment_environment   = "dev"
  spark_runtime_version    = data.databricks_spark_version.this
  cluster_instance_type    = data.databricks_node_type.node_memory_photon_large
  failure_alert_email      = var.failure_alert_email
  databricks_notebook_path = var.databricks_notebook_path
}
```

## Inputs

| Name                     | Description                                                                 | Type           | Default | Required |
|--------------------------|-----------------------------------------------------------------------------|----------------|---------|----------|
| `databricks_job_description` | A description of the Databricks job.                                           | `string`       | n/a     | Yes      |
| `databricks_job_name`        | The name of the Databricks job.                                               | `string`       | n/a     | Yes      |
| `cluster_name`               | The name of the Databricks cluster to run the job on.                         | `string`       | n/a     | Yes      |
| `file_path`                  | A list of file paths to SQL scripts or other resources required by the job.   | `list(string)` | n/a     | Yes      |
| `team_owner`                 | The team responsible for this job.                                            | `string`       | n/a     | Yes      |
| `user_email`                 | The email address of the user responsible for this job.                       | `string`       | n/a     | Yes      |
| `environment`                | The environment in which this job will be deployed (e.g., dev, prod).         | `string`       | `"dev"` | No       |
| `spark_version`              | The version of Spark to use for the job.                                      | `string`       | n/a     | Yes      |
| `node_type_id`               | The node type ID for the cluster nodes (e.g., memory-optimized or general).   | `string`       | n/a     | Yes      |
| `on_failure_alert_email`     | Email address to send alerts to in case of job failure.                       | `string`       | n/a     | Yes      |

## Outputs

| Name                     | Description                                                                                  |
|--------------------------|----------------------------------------------------------------------------------------------|
| `databricks_job_id`      | The ID of the Databricks job created by this module.                                         |
| `databricks_job_name`    | The name of the Databricks job.                                                              |
| `notebook_paths`         | The paths of the notebooks deployed in Databricks.                                          |

### Example Output Values

```hcl
- databricks_job_id: `"1234"`
- databricks_job_name: `"example_databricks_job"`
notebook_paths: [
"/Workspace/query_1.sql",
"/Workspace/query_2.sql",
"/Workspace/query_3.sql"
]
```


## Example File Paths

The following files are referenced in the example usage:

- **query_1.sql**: Contains SQL queries for extracting data points.
- **query_2.sql**: Contains SQL queries for compliance checks.
- **query_3.sql**: Contains SQL queries for Subject Access Requests (SAR) and Data Processing Agreements (DPA).

Ensure these files are present in your module directory or update the paths accordingly.

## Requirements

- Terraform >= 1.0
- Databricks Provider >= 1.0
- A configured Databricks workspace

## Authors

This module was written by **Asaph Tinoco**, Director of **Cloudnx**, and is an open module available for public use. Feel free to contribute or adapt it to your needs.

---

## License

This module is licensed under the MIT License. See [LICENSE](LICENSE) for full details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.3.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 4.35.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | 1.37.1 |
| <a name="requirement_local"></a> [local](#requirement\_local) | = 2.2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks.workspace"></a> [databricks.workspace](#provider\_databricks.workspace) | 1.37.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_job.this](https://registry.terraform.io/providers/databricks/databricks/1.37.1/docs/resources/job) | resource |
| [databricks_notebook.this](https://registry.terraform.io/providers/databricks/databricks/1.37.1/docs/resources/notebook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name assigned to the Databricks cluster for identification. | `string` | n/a | yes |
| <a name="input_databricks_job_description"></a> [databricks\_job\_description](#input\_databricks\_job\_description) | A brief description of the Databricks job to provide context or purpose. | `string` | n/a | yes |
| <a name="input_databricks_job_name"></a> [databricks\_job\_name](#input\_databricks\_job\_name) | The name displayed for the Databricks job in the UI. | `string` | n/a | yes |
| <a name="input_databricks_notebook_path"></a> [databricks\_notebook\_path](#input\_databricks\_notebook\_path) | The full path in Databricks where the notebook will be stored. This should include the workspace directory structure (e.g., '/Workspace/Team/Project/Notebook'). | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment where the job will be deployed (e.g., dev, staging, production). | `string` | n/a | yes |
| <a name="input_file_path"></a> [file\_path](#input\_file\_path) | The path or list of paths to the files or notebooks to be executed in the job. | `list(string)` | n/a | yes |
| <a name="input_node_type_id"></a> [node\_type\_id](#input\_node\_type\_id) | The type of EC2 instance to use for the Databricks cluster nodes (e.g., i3.xlarge, m5d.large). | `any` | n/a | yes |
| <a name="input_on_failure_alert_email"></a> [on\_failure\_alert\_email](#input\_on\_failure\_alert\_email) | A list of email addresses to notify when the job fails. | `list(string)` | n/a | yes |
| <a name="input_service_principal_id"></a> [service\_principal\_id](#input\_service\_principal\_id) | Service Principal ID | `string` | `null` | no |
| <a name="input_spark_version"></a> [spark\_version](#input\_spark\_version) | The Databricks Runtime version to be used for the Spark job (e.g., 13.3.x-scala2.12). | `string` | n/a | yes |
| <a name="input_team_owner"></a> [team\_owner](#input\_team\_owner) | The team responsible for managing the Databricks cluster. | `string` | n/a | yes |
| <a name="input_user_email"></a> [user\_email](#input\_user\_email) | The user responsible for the job; this is the point of contact for any issues. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_databricks_job_id"></a> [databricks\_job\_id](#output\_databricks\_job\_id) | The ID of the Databricks job created by this module. |
| <a name="output_databricks_job_name"></a> [databricks\_job\_name](#output\_databricks\_job\_name) | The name of the Databricks job. |
| <a name="output_notebook_paths"></a> [notebook\_paths](#output\_notebook\_paths) | The paths of the notebooks deployed in Databricks. |
<!-- END_TF_DOCS -->