#
# Variables used for customizing the VM creation
#

variable "vm_count" {
  description = "Defines the count used to create VMs"
  default     = "1"
}

variable "name" {
  description = "Defines the name of the VMs"
  default     = "my_name"
}

variable "description" {
  description = "Defines the description of the VMs"
  default     = "my_desc"
}

variable "cluster_uuid" {
  description = "Defines the Cluster UUID where to deploy VM"
  default     = ""
}

variable "vcpus_per_socket" {
  description = "Defines the number of vCPUS per Socket"
  default     = "1"
}

variable "sockets" {
  description = "Defines the number of Sockets"
  default     = "1"
}

variable "memory_size_mib" {
  description = "Defines the size in MiB of the Memory of the VM"
  default     = "2048"
}

variable "nic_lists" {
  description = "Defines the list of Nic with its configuration"
  type        = list(map(string))
  default = [
    {
      "nic_type"                  = "NORMAL_NIC"
      "model"                     = "VIRTIO"
      "network_function_nic_type" = "INGRESS"
      "subnet_name"               = "my_subnet"
    }
  ]
}

variable "disk_lists" {
  description = "Defines the list of Disk with its configuration"
  type        = list(map(string))
  default = [
    {
      "disk_size_mib" = "100000" # Disk Size in MegaBytes
      "device_type"   = "CDROM"  # TYpe of the Device - Could be CDROM or DISK
      "device_index"  = 0
      "adapter_type"  = "IDE"
      "kind"          = "image"
      "name"          = "image_name "
    },
    {
      "disk_size_mib" = "100000" # Disk Size in MegaBytes
    }
  ]
}

#
# Variables used for Data Sources
#

variable "subnet_name" {
  description = "Defines the subnet's name used to retrieve the ID"
  default     = ""
}

variable "image_name" {
  description = "Defines the image's name used to retrieve the ID"
  default     = "1"
}