terraform {
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = "1.0.7"
    }
  }
}

provider "intersight" {
  apikey = "5bfbef9e356c36396a62b69c/5cddc68d7564612d30e3be85/60896ba27564612d3016595c"
  endpoint = "https://www.intersight.com"
  secretkey = "https://github.com/ArielLeza/terraform-intersight-prod/blob/a18a0bdb56a84f0444b73f24ae2ec10ca099814a/SecretKey.txt"
}
