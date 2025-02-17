# How to run for Ubuntu
                                 
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

Then run packer:

    # Only once
    $ packer init .
    
    $ packer build .
