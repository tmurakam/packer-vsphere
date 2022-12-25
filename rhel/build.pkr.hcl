
build {
  sources = [
    "source.vsphere-iso.rhel"
  ]

  provisioner "shell" {
    inline = [
      "ls /"
    ]
  }
}
