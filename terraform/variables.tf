variable "proxmox_endpoint" {
  description = "Proxmox API URL"
}
variable "proxmox_api_token" {
  description = "Proxmox API token"
  sensitive   = true
}
variable "proxmox_ssh_user" {
  description = "Proxmox SSH kasutajanimi"
}
variable "proxmox_ssh_password" {
  description = "Proxmox SSH parool"
  sensitive   = true
}
