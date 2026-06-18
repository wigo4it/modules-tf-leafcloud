#############################################
# Leafcloud Object Store Container Module
#############################################
# This module creates OpenStack Object Store Container

resource "openstack_objectstorage_container_v1" "container" {
  for_each = toset(var.containers)
  region   = var.region
  name     = each.value
}
