terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.60.0"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://192.168.10.160:8006/"
  api_token = "root@pam!sten=259d9e8c-9d99-494c-b73d-e756144862c6"
  insecure  = true
}
