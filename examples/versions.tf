terraform {
  required_version = "= 1.3.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.35.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "= 2.2.2"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.37.1"
    }
  }
}
