# Defines an instance template used to create VM instances
resource "google_compute_instance_template" "server-templates" {
  name         = "ec2-templates"  
  machine_type = "e2-medium"      

  # Configures the boot disk for the instance template
  disk {
    source_image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20240809"  # Ubuntu 24.04 image
  }

  # Configures the network interface for the instance template
  network_interface {
    network = "default"  # Uses the default VPC network

    # Adds an access configuration for external access, using the Premium network tier
    access_config {
      network_tier = "PREMIUM"
    }
  }
}

# Creates VM instances from the instance template, based on the defined server roles
resource "google_compute_instance_from_template" "server-from-template" {
  zone                     = var.zone  
  count                    = length(var.server_roles)  
  name                     = var.server_roles[count.index]  # Names the instances based on the server roles
  source_instance_template = google_compute_instance_template.server-templates.self_link_unique  
}
