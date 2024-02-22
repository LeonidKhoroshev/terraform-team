output "vpc_network_id" {
  value = module.vpc_prod.network_id
}

output "vpc_subnet_id" {
  value = [module.vpc_prod.subnet_id]
}
