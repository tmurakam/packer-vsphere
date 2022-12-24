source "vsphere-iso" "ubuntu" {
  vcenter_server = var.vcenter_server
  username = var.vcenter_username
  password = var.vcenter_password
  insecure_connection = true

  vm_name = "ubuntu-server"
  host = var.vcenter_host

  guest_os_type = "ubuntu64Guest"

  ssh_username = "ubuntu"
  ssh_password = "ubuntu"
  ssh_handshake_attempts = 100

  CPUs = 4
  RAM = 4096
  RAM_reserve_all = false

  datastore = var.vcenter_datastore
  disk_controller_type = ["pvscsi"]
  storage {
    disk_size             = var.storage_disk_size
    disk_thin_provisioned = true
  }

  network_adapters {
    network      = var.network
    network_card = "vmxnet3"
  }

  iso_paths = [
    var.os_iso_path
  ]

  # Provide autoinstall files
  http_directory = "http"

  # Boot and use 'autoinstall'
  boot_wait = "2s"
  boot_command = [
    "<esc><esc><esc>",
    "<enter><wait>",
    "/casper/vmlinuz ",
    "root=/dev/sr0 ",
    "initrd=/casper/initrd ",
    "autoinstall ",
    "ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter>"
  ]

  # Install VMware tools
  tools_upgrade_policy = true
}
