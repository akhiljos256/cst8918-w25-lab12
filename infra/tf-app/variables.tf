# Required tags for Azure resources
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    environment = "production"
    project     = "cst8918-lab12"
    owner       = "akhiljos256"
  }
}
