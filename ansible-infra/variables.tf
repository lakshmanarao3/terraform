variable "project" {
  default = "your-project-id"  # Replace with your actual GCP project ID
}

variable "region" {
  default = "GCP-region"  # Replace with your desired GCP region (e.g., "us-central1")
}

variable "zone" {
  default = "GCP-zone"  # Replace with your desired GCP zone (e.g., "us-central1-a")
}

variable "server_roles" {
  type    = list(string)  # Specifies that this variable is a list of strings
  default = ["smb-server", "test-server"]  
}
