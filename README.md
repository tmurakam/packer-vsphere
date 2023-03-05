# Packer vSphere files

# References

- [Packer Builder for VMware vSphere](https://developer.hashicorp.com/packer/plugins/builders/vsphere/vsphere-iso)

# How to run

* [Ubuntu](./ubuntu/README.md)
* [RHEL](./rhel/README.md)

# Limitations

It seems that when create template with 'convert_to_template = true' on NFS datastore,
the template becomes thick provisioned.
To avoid this, you need set conver_to_template = false, and convert to template
on vSphere console.
