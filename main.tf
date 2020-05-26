resource "nutanix_virtual_machine" "new" {
  count                = var.vm_count
  name                 = "${var.name}-${count.index}"
  description          = var.description
  cluster_uuid         = var.cluster_uuid
  num_vcpus_per_socket = var.vcpus_per_socket
  num_sockets          = var.sockets
  memory_size_mib      = var.memory_size_mib

  dynamic "nic_list" {
    for_each = var.nic_lists
    content {
      nic_type                  = lookup(nic_lists.value, "nic_type", null)
      model                     = lookup(nic_lists.value, "model", null)
      network_function_nic_type = lookup(nic_lists.value, "network_function_nic_type", null)
      subnet_name               = lookup(nic_lists.value, "subnet_name", null)
    }
  }

  dynamic "disk_list" {
    for_each = var.disk_lists
    content {
      disk_size_mib = lookup(disk_lists.value, "disk_size_mib", null)

      device_properties {
        device_type = lookup(disk_lists.value, "device_type", null)
        disk_address = {
          device_index = lookup(disk_lists.value, "device_index", null)
          adapter_type = lookup(disk_lists.value, "adapter_type", null)
        }
      }

      data_source_reference = {
        kind = lookup(disk_lists.value, "kind", null)
        name = lookup(disk_lists.value, "name", null)
      }
    }
  }
}

