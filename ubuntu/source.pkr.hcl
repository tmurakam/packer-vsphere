locals {
  boot_commands = {
    20.04 = [
      "<esc><esc><esc>",
      "<enter><wait>",
      "/casper/vmlinuz ",
      "root=/dev/sr0 ",
      "initrd=/casper/initrd ",
      "autoinstall ",
      "ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
      "<enter>"
    ]

    22.04 = [
      "<esc><esc><esc><esc>e<wait>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "<del><del><del><del><del><del><del><del>",
      "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"<enter><wait>",
      "initrd /casper/initrd<enter><wait>",
      "boot<enter>",
      "<enter><f10><wait>"
    ]
  }
}

source "vsphere-iso" "ubuntu" {
  vcenter_server = var.vcenter_server
  username = var.username
  password = var.password
  insecure_connection = true

  vm_name = var.vm_name
  host = var.host

  guest_os_type = "ubuntu64Guest"

  ssh_username = "vsphere"
  ssh_password = "vsphere"
  ssh_timeout = "30m"
  ssh_handshake_attempts = 100

  CPUs = 4
  RAM = 4096
  RAM_reserve_all = false

  datastore = var.datastore
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
    var.iso_path
  ]

  # Provide autoinstall files
  http_directory = "http"

  # Boot and use 'autoinstall'
  boot_wait = "2s"

  # Boot command
  boot_command = local.boot_commands[var.os_version]

  # Install VMware tools
  tools_upgrade_policy = true

  # Convert to template?
  convert_to_template = var.convert_to_template
}
