variable "api_key" {
  type        = string
  description = "API Key"
}
variable "secretkey" {
  type        = string
  description = "Secret Key or file location"
  default = "MIIEowIBAAKCAQEAvPpeWcBfWCB2ItQCxYjqEV7Guv3c7EZ/FC9W1Sw9KI1D6PmgsOGTwOeEw55Y1JDW531J/YfqpLqedAo/PFjE7sEIzGcdfM98nyWYoXbcaijIcBWcBczg41suZCHk26CJEySgcMIzLketLSENuUt0f10+fBwuRR/8lXfkxhXuCwHSJjiwhjKG8XLERCkUQwk4FKpV+b0a+aCJt2T5Th/wlwZwDyhfQ4gTGXZr432KdDSoaDRxtf81Br2cp7kQj58vF/clqNKSzPDlnw3JhS2BoYB/VF0Ba0KS634nPkmw+mL5tMp3zwaDLB8zyBv866nAYT4me6kY3vhwSPOF+L5rjwIDAQABAoIBAB/SmWjLuEKC1OHwibbx41iheR2r+jPfey7O+fRTysi1YSYuQx0GH3dwhS7bz2GcMlQxCPCknqK2ulAYGaXz3NXHs8+X3aNS3U1/a0BlX6CQ1Y/qU6e2ZHhktl8uRfemBO8wT8QtL6kvcL4UvtbhGfEIpqkHpdMGG+afleq1bqxzi+Hn+g555YC2YzRXnmRt5HW25ioaW+WG9ygttD5DxLlyHiW4/twrci5pSutDBHCvrAIkz3/HNXTpi1s6zrKBGb90giwR4e3F5167CYab26zLIUzp3X1Aayd0CByZ82+WfOskpstG5NM5Lc9Y4D68ftz/x+s8aZR45qSHaSQDYYECgYEA0ZfLMMVgZbgkICYL95Cs9iWVGlY5CrrKo8Uhk5Noo+wyFmUJS15M8hcvp+mIAKgOgdMs1wAevb4CYlCBZ2OXQIfLHeaxOMMgQAcQ+xgTYpMgSYP1w1lRnTxCm2QHWBgUkwYvArVstzeCqCvFqaImudU+GUwhfnQpHh7Q8zoGW7ECgYEA5tISqUPWZgLvuL7w+Yd8byFjdJY8MyLXFq3zrvBwhrlUxvi7aSPPEe8sqVVnBiOlEUqwKSAOLnF89h/F86ZUSjldE7bm2XF2Vp32fanAttdJtQY9PzQ6cBLnrT3Fo+nHA0Ti29EwBFIv9dcCXMKsviNeHdFAC5jeGDtwSkqhSz8CgYBFKWvZaihHKJ5zJVrplIoep4QuLqmgCsd3h0NvKUNsZDKbBTgt8K4/bLtDE2LXpJ005fRz9gwu3JZ4zswEy+5LUwQJl+h/LJRlzG8kDGvJKXeMCsl8burpkcsA798kiL2xTmcQ48E+LEknKVqOgX158Q4O1vpuefJfiBe3Szxx4QKBgQCjv3JHrH2EHx8rhCH2E9z+BcTFp/MLH/NQ/pT6jU529TGkej6SBzpWccPQWWreGxl2W/L/KeOFpTNOdBn9kQkJIwrZ+o5owip+pk+AtJWn4LFEgCmhFg9DBNZgu4rjjuyFcDA0W4Hh/uBRWngtkFn2Bac2JgV2dLtSm5A81Bb7BwKBgE1ifTXcZ/YmFehdC9EWY2Qgwrw+TAEFI5hLT1vf5aWjOTgc+VnzV/aNLU1Cl9A+ZW0fSGS/GkT4m1ZEJEMiJsnmjO4u+gSRab67gZwXmaZIv5qd9eVxP6EisUe7dozq4PM0a7hskyihFzeYkSdrnEmu3TDjeHKv6KaEhJjwc6tH"
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
}
variable "ssh_key" {
  type        = string
  description = "SSH Public Key to be used to node login."
}
variable "vc_password" {
  sensitive   = true
  type        = string
  description = "Password of the account to be used with vCenter.  This should be the password for the account used to register vCenter with Intersight."
}
variable "tags" {
  type    = list(map(string))
  default = []
}
