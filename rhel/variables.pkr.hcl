variable "vcenter_server" {}
variable "username" {}
variable "password" {}

variable "host" {}
variable "datastore" {}

variable "vm_name" {
  description = "VM name"
  default = "rhel-server"
}

variable "iso_path" {
  description = "ISO path (ex. [datastore1] ISOs/AlmaLinux-8.4-x64_64-minimal.iso)"
}

variable "storage_disk_size" {
  description = "Disk size (MB)"
  default = 100000
}

variable "network" {
  default = "VM Network"
}

variable "convert_to_template" {
  description = "Convert to template?"
  default = false
}
