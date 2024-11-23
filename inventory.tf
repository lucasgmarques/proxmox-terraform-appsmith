resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl",
    {
      vm = {
        index      = range(local.vm.count)
        ip_address = proxmox_vm_qemu.vm.*.default_ipv4_address
        user       = proxmox_vm_qemu.vm.*.ciuser
        vm_name    = proxmox_vm_qemu.vm.*.name
      }
    }
  )
  filename        = "inventory.ini"
  file_permission = "0600"
}