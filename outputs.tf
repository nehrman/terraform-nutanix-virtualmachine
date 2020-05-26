#output "ip_address" {
#    value = nutanix_virtual_machine.nut_test_fmo.nic_list_status.0.ip_endpoint_list[0]["ip"]
#}

output "vm_name" {
  value = nutanix_virtual_machine.new.*.metadata.name
}
