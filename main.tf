
module "vpc_prod" {
  source          = "./vpc"
  env_name        = var.env_name
  subnets         = var.subnets
}
module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=282797c08889fb2ab78c1ac69fcd435453df860d"
  env_name        = var.env_name
  network_id      = module.vpc_prod.network_id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = ["e9bu0n9q4rd8st5emp8g"]
  instance_name   = var.vm_name
  instance_count  = var.vm_count
  image_family    = var.image_family
  public_ip       = var.public_ip
  
  metadata = {
      user-data   = "${data.template_file.cloudinit.rendered}"
  }
}

data "template_file" "cloudinit" {
 template              = file("./cloud-init.yml")
 vars                  = {
   ssh-authorized-keys = file(var.ssh_public_key[0])
 }
}
