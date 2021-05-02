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
  apikey =  var.api_key
  endpoint = "https://www.intersight.com"
  secretkey = "https://github.com/ArielLeza/terraform-intersight-prod/blob/754428741356fc6df80339f86760129cb0439f7d/SecretKey.pem"
}
