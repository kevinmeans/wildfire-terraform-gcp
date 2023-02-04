variable "project_id" {
description = "Google Project ID."
type        = string
}

variable "region" {
description = "Google Cloud region"
type        = string
default     = "us-west1"
}

variable "bucket_name" {
description = "GCS Bucket name."
type        = string
}

variable "bigquery_external_table_id" {
description = "Bigquery external table id. (poc)"
type        = string
}

variable "bigquery_internal_table_id" {
description = "Bigquery internal table id. (poc)"
type        = string
}

variable "bigquery_dataset_id" {
description = "Bigquery Dataset id"
type        = string
}

variable "bigquery_dataset_description" {
description = "Bigquery Dataset Description"
type        = string
}

