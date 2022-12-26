variable "vcenter_server" {}
variable "vcenter_username" {}
variable "vcenter_password" {}

variable "vcenter_host" {}
variable "vcenter_datastore" {}

variable "vm_name" {
  description = "VM name"
  default = "rhel-server"
}

variable "os_iso_path" {
  description = "ISO path (ex. [datastore1] ISOs/AlmaLinux-8.4-x64_64-minimal.iso)"
}

variable "storage_disk_size" {
  description = "Disk size (MB)"
  default = 32768
}

variable "network" {
  default = "VM Network"
}

variable "convert_to_template" {
  description = "Convert to template?"
  default = false
}
