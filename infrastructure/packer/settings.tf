terraform {
  required_providers {
    opentelekomcloud = {
      source = "opentelekomcloud/opentelekomcloud"
      version = ">= 1.22.0"
    }
  }
}

# Configure the OpenTelekomCloud Provider
provider "opentelekomcloud" {
  cloud = "devstack"
}