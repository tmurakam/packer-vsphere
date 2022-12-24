source "vsphere-iso" "ubuntu" {
  vcenter_server = var.vcenter_server
  username = var.vcenter_username
  password = var.vcenter_password
  insecure_connection = true

  vm_name = "example-ubuntu"
  host = var.vcenter_host

  guest_os_type = "ubuntu64Guest"

  ssh_username = "ubuntu"
  ssh_password = "ubuntu"
  ssh_handshake_attempts = 100

  CPUs = 2
  RAM = 1024
  RAM_reserve_all = false

  datastore = var.vcenter_datastore
  disk_controller_type = ["pvscsi"]
  storage {
    disk_size             = 32768
    disk_thin_provisioned = true
  }

  network_adapters {
    network = "VM Network"
    network_card = "vmxnet3"
  }

  iso_paths = [
    var.os_iso_path
  ]

  http_directory = "http"

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
}

build {
  sources = [
    "source.vsphere-iso.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "ls /"
    ]
  }
}
