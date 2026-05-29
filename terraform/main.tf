# Laeb Ubuntu 22.04 cloud-image alla Proxmoxi
resource "proxmox_download_file" "ubuntu_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve"
  url          = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  file_name    = "ubuntu-22.04-cloud.img"
}

# Loob template
resource "proxmox_virtual_environment_vm" "template" {
  name      = "sten-template"
  node_name = "pve"
  vm_id     = 104
  template  = true

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
  }
  memory {
    dedicated = 2048
  }
  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_download_file.ubuntu_image.id
    interface    = "scsi0"
    size         = 20
  }
  network_device {
    model  = "virtio"
    bridge = "vmbr0"
  }
  scsi_hardware = "virtio-scsi-pci"
}

# Web VM
resource "proxmox_virtual_environment_vm" "web" {
  name       = "sten-web-01"
  node_name  = "pve"
  depends_on = [proxmox_virtual_environment_vm.template]

  clone {
    vm_id = proxmox_virtual_environment_vm.template.vm_id
  }
  cpu {
    cores = 2
  }
  memory {
    dedicated = 2048
  }
  network_device {
    model  = "virtio"
    bridge = "vmbr0"
  }
  scsi_hardware = "virtio-scsi-pci"

  initialization {
    user_account {
      username = "ubuntu"
      password = "ubuntu123"
      keys     = [var.ssh_public_key]
    }
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}

# DB VM
resource "proxmox_virtual_environment_vm" "db" {
  name       = "sten-db-01"
  node_name  = "pve"
  depends_on = [proxmox_virtual_environment_vm.template]

  clone {
    vm_id = proxmox_virtual_environment_vm.template.vm_id
  }
  cpu {
    cores = 2
  }
  memory {
    dedicated = 2048
  }
  network_device {
    model  = "virtio"
    bridge = "vmbr0"
  }
  scsi_hardware = "virtio-scsi-pci"

  initialization {
    user_account {
      username = "ubuntu"
      password = "ubuntu123"
      keys     = [var.ssh_public_key]
    }
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}

# Monitor VM
resource "proxmox_virtual_environment_vm" "monitor" {
  name       = "sten-monitor-01"
  node_name  = "pve"
  depends_on = [proxmox_virtual_environment_vm.template]

  clone {
    vm_id = proxmox_virtual_environment_vm.template.vm_id
  }
  cpu {
    cores = 1
  }
  memory {
    dedicated = 1024
  }
  network_device {
    model  = "virtio"
    bridge = "vmbr0"
  }
  scsi_hardware = "virtio-scsi-pci"

  initialization {
    user_account {
      username = "ubuntu"
      password = "ubuntu123"
      keys     = [var.ssh_public_key]
    }
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
