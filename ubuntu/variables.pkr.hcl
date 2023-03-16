variable "vcenter_server" {}
variable "username" {}
variable "password" {}

variable "host" {}
variable "datastore" {}

variable "vm_name" {
  description = "VM name"
  default = "ubuntu-server"
}

variable "os_version" {
  description = "OS version (20.04 or 22.04)"
  default = "22.04"
}

variable "iso_path" {
  description = "ISO path (ex. [datastore1] ISOs/ubuntu-20.04.2-live-server-amd64.iso)"
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
