

resource "intersight_kubernetes_aci_cni_apic" "kubernetes_aci_cni_apic1" {
  num_aci_cni_profiles = 3
  organization {
    object_type = "organization.Organization"
    moid        = "5ddfa5746972652d31ecc663"
  }
  registered_device {
    moid        = "5f93beec6f72612d3017fac1"
    object_type = "asset.DeviceRegistrations"
  }
}

resource "intersight_kubernetes_aci_cni_profile" "kubernetes_aci_cni_profile1" {
  description           = "kubernetes aci cni profile"
  name                  = "IKS ACI-CNI for EBC-Cloud"
  type                  = "instance"
  node_svc_subnet_start = "10.0.0.0/8"
  pod_subnet_start      = "10.0.0.0/8"
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  registered_device {
    moid        = intersight_registered_device.device1.id
    object_type = "asset.DeviceRegistrations"
  }
}
