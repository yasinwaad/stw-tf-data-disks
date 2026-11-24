# stw-tf-data-disks

Terraform module that generates managed data disks and attaches them to Virtual Machines.

## Usage

```hcl
module "data_disks" {
  source = "git::https://github.com/yasinwaad/stw-tf-data-disks.git?ref=v1.0.0"

  project_name        = "example"
  environment         = "dev"
  owner               = "Yasin"
  resource_group_name = "rg-example-dev-southafricanorth"
  virtual_machine_ids = module.vm_nic.vm_ids

  data_disks = {
    data1 = {
      vm_key = "linux"
      lun    = 10
    }
    data2 = {
      vm_key = "linux"
      lun    = 20
    }
  }
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| project_name | Project name used in resource names | string | n/a |
| environment | Environment name, e.g. prod | string | n/a |
| owner | Owner tag value | string | n/a |
| resource_group_name | Name of the existing resource group | string | n/a |
| virtual_machine_ids | Map of VM IDs, keyed