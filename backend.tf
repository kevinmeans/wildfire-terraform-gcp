terraform {
  backend "gcs" {
    bucket = "terraform_states_km"   # GCS bucket name to store terraform tfstate
    prefix = "terraform_bigquery_table"           # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}

