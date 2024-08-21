# Configures the Terraform backend and specifies the required providers
terraform {
  required_providers {
    google = {
      # Specifies the source and version of the Google Cloud provider
      source  = "hashicorp/google"
      version = "5.41.0"
    }
  }
}

# Configures the Google Cloud provider with project and region variables
provider "google" {
  project = var.project  
  region  = var.region   
}
