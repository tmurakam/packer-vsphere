
build {
  sources = [
    "source.vsphere-iso.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      # remove machine-id to avoid DHCP ip duplication
      "sudo rm /etc/machine-id",
      "sudo touch /etc/machine-id"
    ]
  }
}
