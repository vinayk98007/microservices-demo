variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region for the cluster"
  type        = string
  default     = "us-central1"
}

variable "credentials_file" {
  description = "Path to the GCP credentials file"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "my-gke-cluster"
}

variable "machine_type" {
  description = "The machine type for the cluster nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size_gb" {
  description = "The size of the boot disk for each node in GB"
  type        = number
  default     = 50  # Adjust this based on your quota
}

variable "disk_type" {
  description = "The type of disk for the nodes (pd-standard to avoid SSD quota issues)"
  type        = string
  default     = "pd-standard"
}

variable "environment" {
  description = "The environment label for the cluster (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "repo_name" {
  description = "Name of the Artifact Registry repository"
  default     = "my-docker-repo"
}
