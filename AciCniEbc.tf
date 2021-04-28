

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
