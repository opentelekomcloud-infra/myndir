terraform {
  required_providers {
    opentelekomcloud = ">= 1.13.1"
  }
}

# Configure the OpenTelekomCloud Provider
provider "opentelekomcloud" {
  user_name   = var.username
  password    = var.password
  domain_name = var.domain_name
  tenant_name = var.tenant_name
  auth_url    = "https://iam.eu-de.otc.t-systems.com:443/v3"
}
