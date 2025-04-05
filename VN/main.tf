variable "varvn" {}

resource "azurerm_virtual_network" "vn-block" {
    for_each = var.varvn
    name=each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    address_space = each.value.address_space 
  
}