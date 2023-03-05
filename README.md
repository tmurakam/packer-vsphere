# Packer vSphere files

# References

- [Packer Builder for VMware vSphere](https://developer.hashicorp.com/packer/plugins/builders/vsphere/vsphere-iso)

# How to run
                                 
In ubuntu directory:

Create `variables.auto.pkrvars.hcl`. See variables.pkr.hcl.

Here is an example:

```
vcenter_server = "vcenter.example.com"
username = "administrator@vsphere.local"
password = "Passw0rd!"

host = "192.168.1.100"  # ESXi host
datastore = "datastore1"

vm_name = "ubuntu-server"

os_version = "22.04"
iso_path = "[datastore1] ISOs/ubuntu-22.04.2-live-server-amd64.iso"

storage_disk_size = 32768
network = "VM Network"

convert_to_template = false
```

Then run `packer build .`

# Limitations

It seems that when create template with 'convert_to_template = true' on NFS datastore,
the template becomes thick provisioned.
To avoid this, you need set conver_to_template = false, and convert to template
on vSphere console.
