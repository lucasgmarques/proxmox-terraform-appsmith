output "vm_ips" {
  description = "Endereços IP das máquinas virtuais criadas"
  value = [
    for idx in range(local.vm.count) :
    cidrhost(local.cidr, local.vm.network_last_octect + idx)
  ]
}
