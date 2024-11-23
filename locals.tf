locals {
  # global configurations
  agent        = 1
  cidr         = "192.168.0.0/24"
  onboot       = true
  proxmox_node = "pve"
  scsihw       = "virtio-scsi-pci"
  template     = "ubuntu-2204-template"

  bridge = {
    interface = "vmbr1"
    model     = "virtio"
  }
  disks = {
    main = {
      backup  = true
      format  = "raw"
      type    = "disk"
      storage = "local-lvm"
      slot    = "scsi0"
    }
    cloudinit = {
      backup  = false
      format  = "raw"
      type    = "cloudinit"
      storage = "local-lvm"
      slot    = "ide2"
    }
  }
  # serial is needed to connect via WebGUI console
  serial = {
    id   = 0
    type = "socket"
  }

  # cloud init information to be injecteds
  cloud_init = {
    user           = "ubuntu"
    password       = 123456789
    ssh_public_key = file("~/.ssh/id_rsa_devops.pub")
  }

  # master specific configuration
  vm = {
    # how many nodes?
    count = 1

    name_prefix = "appsmith"
    vmid_prefix = 400

    # hardware info
    cores     = 2
    disk_size = "40G"
    memory    = 4096
    sockets   = 1

    # 192.168.0.7x and so on...
    network_last_octect = 118
    tags                = "dev"
  }
}