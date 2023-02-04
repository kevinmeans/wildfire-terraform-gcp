# Specify the GCP Provider
provider "google" {
project = var.project_id
region  = var.region
}

# Create a GCS Bucket for Bigquery Table
resource "google_storage_bucket" "purple_air_bucket" {
name     = var.bucket_name
location = var.region
}

# Create DataSet to attach the Bigquery table to
resource "google_bigquery_dataset" "bigquery_data_set" {
  dataset_id                  = var.bigquery_dataset_id
  description                 = var.bigquery_dataset_description
  location                    = var.region
}

# Create Big Query Table of JSON type
resource "google_bigquery_table" "purple_air_data_external" {
  dataset_id = google_bigquery_dataset.bigquery_data_set.dataset_id
  table_id   = var.bigquery_external_table_id
  deletion_protection=false

  external_data_configuration {
    autodetect    = false
    source_format = "NEWLINE_DELIMITED_JSON"
    source_uris   = [
      format("gs://%s/*", var.bucket_name)
    ]
schema = <<EOF
[
  {
    "name": "sensor_index",
    "type": "INT64",
    "mode": "NULLABLE"
  },
  {
    "name": "last_seen",
    "type": "INT64",
    "mode": "NULLABLE"
  },
  {
    "name": "name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "latitude",
    "type": "FLOAT64",
    "mode": "NULLABLE"
  },
  {
    "name": "longitude",
    "type": "FLOAT64",
    "mode": "NULLABLE"
  },
  {
    "name": "channel_flags",
    "type": "NUMERIC",
    "mode": "NULLABLE"
  },
  {
    "name": "confidence",
    "type": "NUMERIC",
    "mode": "NULLABLE"
  },
  {
    "name": "pm2_5",
    "type": "NUMERIC",
    "mode": "NULLABLE"
  },
  {
    "name": "pm2_5_a",
    "type": "NUMERIC",
    "mode": "NULLABLE"
  },
  {
    "name": "pm2_5_b",
    "type": "NUMERIC",
    "mode": "NULLABLE"
  },
  {
    "name": "pm10_0",
    "type": "NUMERIC",
    "mode": "NULLABLE"
  },
  {
    "name": "pm10_0_a",
    "type": "NUMERIC",
    "mode": "NULLABLE"
  },
  {
    "name": "pm10_0_b",
    "type": "NUMERIC",
    "mode": "NULLABLE"
  },
  {
    "name": "batch_timestamp",
    "type": "INT64",
    "mode": "NULLABLE"
  }
]
EOF
  }
}
