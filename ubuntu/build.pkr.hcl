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

      # let cloud-init handle VMware guest customization instead of the legacy
      # Customize.pl, whose 'netplan apply' hangs while the NIC is disconnected
      # during customization on Ubuntu 24.04
      "printf 'disable_vmware_customization: false\\ndatasource_list: [ VMware, OVF, None ]\\n' | sudo tee /etc/cloud/cloud.cfg.d/99-vmware-guest-customization.cfg",

      # remove autoinstall/nocloud kernel parameters copied from the installer boot
      # command, otherwise cloud-init picks NoCloud and ignores VMware customization
      "sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"\"/' /etc/default/grub",
      "sudo update-grub",

      # remove machine-id to avoid DHCP ip duplication
      "sudo rm /etc/machine-id",
      "sudo touch /etc/machine-id"
    ]
  }
}
