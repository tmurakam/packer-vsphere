# How to run for RHEL
                                 
In rhel directory:

Create `variables.auto.pkrvars.hcl`. See variables.pkr.hcl.

Here is an example:

```
vcenter_server = "vcenter.example.com"
username = "administrator@vsphere.local"
password = "Passw0rd!"

host = "192.168.1.100"  # ESXi host
datastore = "datastore1"

vm_name = "almalinux-8"

os_version = "22.04"
iso_path = "[datastore1] ISOs/AlmaLinux-8.7-x86_64-dvd.iso"

storage_disk_size = 32768
network = "VM Network"

convert_to_template = false
```

Then run packer:

    # Only once
    $ packer init .
    
    $ packer build .

# Note

If you need to use proxy server to access the Internet,
set `http_proxy` and `https_proxy` environment variables after `%post` line in `http/rhel8-kickstart.cfg` file.
