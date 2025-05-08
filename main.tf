 terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~> 2.4.0"
    }
  }
}

provider "huaweicloud" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "apache_server" {
  source     = "./modules/apache_server"
  region     = var.region
  image_id   = var.image_id
  flavor_id  = var.flavor_id
  admin_pass = var.admin_pass
}
