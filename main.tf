terraform {
  required_version = ">= 0.13"
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = ">=1.0.7"
    }
  }
}

provider "intersight" {
  apikey    = var.apikey
  secretkey = var.secretkey
  endpoint = "https://intersight.com"
}
