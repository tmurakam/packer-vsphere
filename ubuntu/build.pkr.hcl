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
    "source.vsphere-iso.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      # remove installer-generated cloud-init config and reset cloud-init state,
      # so that VMware guest customization works on cloned VMs
      "sudo rm -f /etc/cloud/cloud.cfg.d/99-installer.cfg /etc/cloud/cloud.cfg.d/90-installer-network.cfg /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
      "sudo cloud-init clean --logs --seed",

      # remove machine-id to avoid DHCP ip duplication
      "sudo rm /etc/machine-id",
      "sudo touch /etc/machine-id"
    ]
  }
}
