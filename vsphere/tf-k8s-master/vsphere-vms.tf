module "vms-vsphere" {
  source                 = "Terraform-VMWare-Modules/vm/vsphere"
  version                = "1.0.3"
  dc                     = "dc1"
  vmrp                   = "c1/Resources"
  vmfolder               = "K8S-1"
  datastore              = "qnap-ds3"
  vmtemp                 = "UbuntuServer1804"
  instances              = 3
  cpu_number             = 2
  ram_size               = 2048
  cpu_hot_add_enabled    = "true"
  cpu_hot_remove_enabled = "true"
  memory_hot_add_enabled = "true"
  vmname                 = "k8s-master-"
  vmdomain               = "orionsystems.io"
  network_cards          = ["VM Network"]
  ipv4submask            = ["24"]
  ipv4 = {
    "VM Network" = ["192.168.222.51", "192.168.222.52", "192.168.222.53"]
  }
  thin_provisioned  = ["true"]
  vmdns             = ["192.168.222.1"]
  dns_suffix_list   = ["orionsystems.io"]
  vmgateway         = "192.168.222.1"
}