provider "intersight" {
  apikey    = var.api_key
  secretkey = var.secretkey
  endpoint  = var.endpoint
}

module "terraform-intersight-iks" {

  source  = "terraform-cisco-modules/iks/intersight//"
  version = "2.1.2"

# Kubernetes Cluster Profile  Adjust the values as needed.
  cluster = {
    name                = "IKS-EBC-Prod-TFC"
    action              = "Deploy"
    wait_for_completion = false
    worker_nodes        = 3
    load_balancers      = 10
    worker_max          = 5
    control_nodes       = 3
    ssh_user            = var.ssh_user
    ssh_public_key      = var.ssh_key
  }


# IP Pool Information (To create new change "use_existing" to 'false' uncomment variables and modify them to meet your needs.)
  ip_pool = {
    use_existing        = false
    name                = "IKS-EBC-Prod-TFC-IpPoolPol"
    ip_starting_address = "172.24.232.101"
    ip_pool_size        = "20"
    ip_netmask          = "255.255.255.0"
    ip_gateway          = "172.24.232.1"
    dns_servers         = ["172.30.101.191","192.168.28.10","192.168.28.11"]
  }

# Sysconfig Policy (UI Reference NODE OS Configuration) (To create new change "use_existing" to 'false' uncomment variables and modify them to meet your needs.)
  sysconfig = {
    use_existing = false
    name         = "IKS-EBC-Prod-TFC-SysconfigPol"
     domain_name  = "ebc.iseslab.cisco.com"
     #timezone     = "UTC"
     ntp_servers  = ["172.30.101.191","192.168.28.10","192.168.28.11"]
     dns_servers  = ["172.30.101.191","192.168.28.10","192.168.28.11"]
  }

# Kubernetes Network CIDR (To create new change "use_existing" to 'false' uncomment variables and modify them to meet your needs.)
  k8s_network = {
    use_existing = false
    name         = "IKS-EBC-Prod-TFC-k8NetworkPol"

    ######### Below are the default settings.  Change if needed. #########
     pod_cidr     = "100.65.0.0/16"
     service_cidr = "100.64.0.0/24"
     cni          = "Calico"
  }
# Version policy (To create new change "useExisting" to 'false' uncomment variables and modify them to meet your needs.)
  versionPolicy = {
    useExisting = false
    policyName     = "IKS-EBC-Prod-TFC-k8VerPol"
    iksVersionName = "1.19.15-iks.3"
  }
# Trusted Registry Policy (To create new change "use_existing" to 'false' and set "create_new' to 'true' uncomment variables and modify them to meet your needs.)
# Set both variables to 'false' if this policy is not needed.
  tr_policy = {
    use_existing = false
    create_new   = false
    name         = "IKS-EBC-Prod-TFC-TrPol"
  }
# Runtime Policy (To create new change "use_existing" to 'false' and set "create_new' to 'true' uncomment variables and modify them to meet your needs.)
# Set both variables to 'false' if this policy is not needed.
  runtime_policy = {
    use_existing = false
    create_new   = false
    # name                 = "IKS-EBC-Prod-TFC-RuntimePol"
    # http_proxy_hostname  = "t"
    # http_proxy_port      = 80
    # http_proxy_protocol  = "http"
    # http_proxy_username  = null
    # http_proxy_password  = null
    # https_proxy_hostname = "t"
    # https_proxy_port     = 8080
    # https_proxy_protocol = "https"
    # https_proxy_username = null
    # https_proxy_password = null
  }

# Infrastructure Configuration Policy (To create new change "use_existing" to 'false' and uncomment variables and modify them to meet your needs.)
  infraConfigPolicy = {
    use_existing = true
  #  platformType = "VmwareVcenter"
#    targetName   = "192.168.31.2"
    policyName   = "iks-ebs-infra-policy"
    # description  = "Test Policy"
#    interfaces   = ["EBC-Cloud-Anywhere-Prod|IKS_APP|Nodes_EPG"]
#    vcTargetName   = "192.168.31.2"
#    vcClusterName      = "LAB-EBC"
#    vcDatastoreName     = "VMDATA-EBC"
    # vcResourcePoolName = optional(string)
#    vcPassword      = var.vc_password
  }

# Addon Profile and Policies (To create new change "createNew" to 'true' and uncomment variables and modify them to meet your needs.)
# This is an Optional item.  Comment or remove to not use.  Multiple addons can be configured.
  addons       = [
  {
  createNew = false
  addonPolicyName = "iks-ebs-infra-policy"
  addonName            = "smm"
  description       = "SMM Policy"
  upgradeStrategy  = "AlwaysReinstall"
  installStrategy  = "InstallOnly"
  releaseVersion = "1.8.1-cisco2-helm3"
  overrides = yamlencode({"demoApplication":{"enabled":true}})
  },
  # {
  # createNew = true
  # addonName            = "ccp-monitor"
  # description       = "monitor Policy"
  # # upgradeStrategy  = "AlwaysReinstall"
  # # installStrategy  = "InstallOnly"
  # releaseVersion = "0.2.61-helm3"
  # # overrides = yamlencode({"demoApplication":{"enabled":true}})
  # }
  ]


# Worker Node Instance Type (To create new change "use_existing" to 'false' and uncomment variables and modify them to meet your needs.)
  instance_type = {
    use_existing = false
    name         = "IKS-EBC-Prod-TFC-WorkerInsTypePol"
    cpu          = 4
    memory       = 16386
    disk_size    = 40
  }

# Organization and Tag Information
  organization = var.organization
  tags         = var.tags
}
