output "vm_ips" {
  description = "IP addresses of the VMs"
  value = [
    for idx in range(local.vm.count) :
    cidrhost(local.cidr, local.vm.network_last_octect + idx)
  ]
}
