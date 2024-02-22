resource "yandex_vpc_network" "db" {
  name           = var.env_name
}

resource "yandex_vpc_subnet" "db_subnets" {
  for_each       = {for i in var.subnets: i.zone => i}
  name           = "${var.env_name}-${each.key}"
  zone           = each.value.zone
  network_id     = "${yandex_vpc_network.db.id}"
  v4_cidr_blocks = [each.value.cidr]
}
