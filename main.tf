provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # Initial settings for cluster
  initial_node_count  = 1
  deletion_protection = false

  # Node pool configuration
  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb  # Disk size per node
    disk_type    = var.disk_type     # Use pd-standard to avoid SSD quota issues
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  # Optional labels for better organization
  resource_labels = {
    environment = var.environment
  }
}


resource "google_artifact_registry_repository" "docker_repo" {
  repository_id = var.repo_name  # Use repository_id instead of name
  location      = var.region
  description   = "Artifact Registry for storing Docker images"
  format        = "DOCKER"

  labels = {
    environment = var.environment
  }
}
# Output the GKE cluster details
output "gke_cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}
