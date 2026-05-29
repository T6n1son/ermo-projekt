resource "proxmox_virtual_environment_vm" "web" {
  name      = "sten-web-01"
  node_name = "pve"

  clone {
    vm_id = data.proxmox_virtual_environment_vms.template.vms[0].vm_id
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

  boot_order    = ["scsi0"]
  scsi_hardware = "virtio-scsi-pci"
}

resource "proxmox_virtual_environment_vm" "db" {
  name      = "sten-db-01"
  node_name = "pve"

  clone {
    vm_id = data.proxmox_virtual_environment_vms.template.vms[0].vm_id
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

  boot_order    = ["scsi0"]
  scsi_hardware = "virtio-scsi-pci"
}

resource "proxmox_virtual_environment_vm" "monitor" {
  name      = "sten-monitor-01"
  node_name = "pve"

  clone {
    vm_id = data.proxmox_virtual_environment_vms.template.vms[0].vm_id
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

  boot_order    = ["scsi0"]
  scsi_hardware = "virtio-scsi-pci"
}

data "proxmox_virtual_environment_vms" "template" {
  filter {
    name   = "name"
    values = ["sten-template"]
  }
}
