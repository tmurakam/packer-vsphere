source "vsphere-iso" "rhel" {
  vcenter_server = var.vcenter_server
  username = var.vcenter_username
  password = var.vcenter_password
  insecure_connection = true

  vm_name = var.vm_name
  host = var.vcenter_host

  guest_os_type = "rhel8_64Guest"

  ssh_username = "vsuser"
  ssh_password = "vsuser"
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

  # Boot and use 'kickstart'
  boot_wait = "2s"
  boot_command = [
    "<esc><wait>",
    "vmlinuz initrd=initrd.img inst.geoloc=0 rd.driver.blacklist=dm-multipath net.ifnames=0 biosdevname=0 ",
    "ks=http://{{.HTTPIP}}:{{.HTTPPort}}/rhel8-kickstart.cfg",
    "<enter>"
  ]

  # Install VMware tools
  tools_upgrade_policy = true

  # Convert to template?
  convert_to_template = var.convert_to_template
}
