terraform {
  required_version = ">= 1.5.7"
  required_providers {
    opentelekomcloud = {
      source                = "opentelekomcloud/opentelekomcloud"
      version               = "~> 1.32"
      configuration_aliases = [opentelekomcloud.project, opentelekomcloud.top_level_project]
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}
