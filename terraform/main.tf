terraform {
  required_version = " >=1.0.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.token
}

resource "digitalocean_droplet" "vm_live_tf" {
  image    = "ubuntu-20-04-x64"
  name     = var.nome_droplet
  region   = var.regiao
  size     = var.setup_troplet
  ssh_keys = [data.digitalocean_ssh_key.key_local.id]
}

data "digitalocean_ssh_key" "key_local" {
  name = "pc mak pro daian"
}

variable "token" {}

variable "nome_droplet" {}

variable "regiao" {}

variable "setup_troplet" {}

output "ip_droplet" {
  value = digitalocean_droplet.vm_live_tf.ipv4_address
}