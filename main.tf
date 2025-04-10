resource "databricks_notebook" "this" {
  for_each = toset(var.file_path)
  provider = databricks.workspace
  source   = each.value
  path     = var.databricks_notebook_path
}

resource "databricks_job" "this" {
  provider    = databricks.workspace
  name        = var.databricks_job_name
  description = var.databricks_job_description

  job_cluster {
    job_cluster_key = var.cluster_name
    new_cluster {
      num_workers   = 1
      spark_version = var.spark_version
      node_type_id  = var.node_type_id
    }
  }

  dynamic "task" {
    for_each = { for idx, path in var.file_path : idx => path }
    content {
      task_key        = "task_${task.key}"
      job_cluster_key = var.cluster_name

      notebook_task {
        notebook_path = databricks_notebook.this[task.value].path
      }

    }
  }

  email_notifications {
    on_failure = var.on_failure_alert_email
  }

  tags = {
    environment = var.environment
    owner       = var.team_owner
    user_email  = var.user_email
    comment     = "Managed by Terraform"
  }
}
