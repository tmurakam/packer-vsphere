
build {
  sources = [
    "source.vsphere-iso.rhel"
  ]

  provisioner "shell" {
    inline = [
      # remove machine-id to avoid DHCP ip duplication
      "rm /etc/machine-id",
      "touch /etc/machine-id"
    ]
  }
}
