provider "intersight" {
  apikey    = var.api_key
  secretkey = var.secretkey
  endpoint  = var.endpoint
}

module "terraform-intersight-iks" {
  source = "terraform-cisco-modules/iks/intersight//"
  # Infra Config Policy Information
  cluster_name = "IKS-EBC-Prod-TFC"
  # cluster_action   = "Deploy"
  vc_target_name   = "192.168.31.2"
  vc_portgroup     = ["MGMT-30"]
  vc_datastore     = "DS-1"
  vc_cluster       = ""
  vc_resource_pool = ""
  vc_password      = var.vc_password

  # IP Pool Information
  ip_starting_address = "172.30.232.10"
  ip_pool_size        = "90"
  ip_netmask          = "255.255.255.0"
  ip_gateway          = "172.30.232.1"
  ip_primary_dns      = "172.30.101.191"
  ip_secondary_dns    = "192.168.28.10"
  ip_primary_ntp      = "192.168.30.1"

  # Network Configuration Settings
  # pod_cidr = "100.65.0.0/16"
  # service_cidr = "100.64.0.0/24"
  # cni = "Calico"
  domain_name         = "ebc.iseslab.cisco.com"
  timezone            = "Asia/Jerusalem"
  unsigned_registries = ["10.101.128.128"]
  # root_ca_registries  = [""]

  # Cluster information
  ssh_user       = var.ssh_user
  ssh_key        = var.ssh_key
  worker_size    = "small"
  worker_count   = 4
  master_count   = 1
  load_balancers = 3
  # Organization and Tag
  organization = var.organization
  tags         = var.tags
}
