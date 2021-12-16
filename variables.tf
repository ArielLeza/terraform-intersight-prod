variable "apikey" {
  type        = string
  description = "API Key"
}
variable "secretkey" {
  type        = string
  description = "Secret Key or file location"
}
variable "endpoint" {
  type        = string
  description = "API Endpoint URL"
  default     = "https://www.intersight.com"
}
variable "organization" {
  type        = string
  description = "Organization Name"
  default     = "default"
}
variable "ssh_user" {
  type        = string
  description = "SSH Username for node login."
  default     = "iksadmin"
}
variable "ssh_key" {
  type        = string
  description = "SSH Public Key to be used to node login."
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVNXLicOb1aMaVMGBuutCh8b50WNVi1OCMLct7Rrkox aleza@cisco.com"
}
variable "tags" {
  type    = list(map(string))
  default = []
}
variable "vc_password" {
  sensitive   = true
  type        = string
  description = "Password of the account to be used with vCenter.  This should be the password for the account used to register vCenter with Intersight."
}
