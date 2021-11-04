terraform {
  required_version = ">= 0.12"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.86.0"
    }
  }
  backend "gcs" {
    bucket    =   "nice-proposal-229011-tfstate"
    prefix    =   "env/dev"
  }
  
}

provider "google" {
  project     = var.project
  region      = var.region
  
}

module "gke" {

  source                = "../../modules/GKE"
  name                  = "gke-pratice-1"
  location              = "us-central1-a"
  gke_service_acct      = "83608490393-compute@developer.gserviceaccount.com"
  #node_location        = ["us-central1-a"]
  project               = var.project
  network               = "default"
  #initial_node_count  = 1
}