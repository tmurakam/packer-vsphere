# How to run for RHEL 8/9
                                 
In rhel directory:

Create `variables.auto.pkrvars.hcl`. See variables.pkr.hcl.

Here is an example:

```
vcenter_server = "vcenter.example.com"
username = "administrator@vsphere.local"
password = "Passw0rd!"

host = "192.168.1.100"  # ESXi host
datastore = "datastore1"

vm_name = "rocky-9"

iso_path = "[datastore1] ISOs/Rocky-9.5-x86_64-dvd.iso"

storage_disk_size = 32768
network = "VM Network"

convert_to_template = false
```

If you want to use RHEL/AlmaLinux/RockyLinux 8 instead of 9, you need to change
`guest_os_type` to `rhel8_64Guest` in `source.pkr.hcl`.

Then run packer:

    # Only once
    $ packer init .
    
    $ packer build .

# Note

If you need to use proxy server to access the Internet,
set `http_proxy` and `https_proxy` environment variables after `%post` line in `http/rhel-kickstart.cfg` file.
