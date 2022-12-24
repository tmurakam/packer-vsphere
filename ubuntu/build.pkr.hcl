
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
