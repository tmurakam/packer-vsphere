packer {
  required_plugins {
    vsphere = {
      version = "~> 1"
      source  = "github.com/hashicorp/vsphere"
    }
  }
}

build {
  sources = [
    "source.vsphere-iso.rhel"
  ]

  provisioner "shell" {
    inline = [
      # remove machine-id to avoid DHCP ip duplication
      "sudo rm /etc/machine-id",
      "sudo touch /etc/machine-id"
    ]
  }
}
