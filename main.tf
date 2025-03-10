module "naming" {
  source  = "Azure/naming/azurerm"
  version = ">= 0.3.0"
}

resource "azurerm_resource_group" "logging" {
  location = var.region_with_availability_zone
  name     = module.naming.resource_group.name_unique
}

resource "azurerm_resource_group" "hub-net" {
  location = var.region_with_availability_zone
  name     = module.naming.resource_group.name_unique
}

resource "azurerm_resource_group" "platform-dns" {
  location = var.region_with_availability_zone
  name     = module.naming.resource_group.name_unique
}

module "hub-vnet" {
  source                    = "git@github.com:cloudysideup/modules-tf.git//azure/virtual_network_hub?ref=main"
  hub_vnet_name             = module.naming.virtual_network.name_unique
  hub_vnet_region           = azurerm_resource_group.hub-net.location
  hub_vnet_rg_name          = azurerm_resource_group.hub-net.name
  hub_vnet_cidr             = var.hub_cidr
  hub_gateway_cidr          = var.gateway_subnet_cidr
  hub_private_endpoint_cidr = var.private_endpoint_subnet_cidr
  hub_firewall_cidr         = var.firewall_subnet_cidr
  private_dns_in_cidr       = var.private_dns_in_subnet_cidr
  private_dns_out_cidr      = var.private_dns_out_subnet_cidr
  hub_vnet_tags             = { placeholder = "placeholder" }
}

module "platform-dns" {
  source                          = "git@github.com:cloudysideup/modules-tf.git//azure/private_dns_zone?ref=main"
  for_each                        = toset(var.dns_zones)
  private_dns_zone_subdomain      = each.key
  private_dns_zone_resource_group = azurerm_resource_group.platform-dns.name
  hub_vnet_id                     = module.hub-vnet.hub_vnet_id
}

module "private-law" {
  source                      = "git@github.com:cloudysideup/modules-tf.git//azure/log_analytics_workspace?ref=main"
  workspace_name              = module.naming.log_analytics_workspace.name_unique
  workspace_region            = azurerm_resource_group.logging.location
  workspace_rg_name           = azurerm_resource_group.logging.name
  workspace_retention_in_days = var.law_retention_in_days
}

#module "firewall-east-west" {
#  source           = "git@github.com:cloudysideup/modules-tf.git//azure/firewall_pfsense?ref=main"
#  count            = local.create_firewall == "true" ? 1 : 0
#  firewall_name    = module.naming.firewall.name_unique
#  firewall_region  = azurerm_resource_group.hub-net.location
#  firewall_rg_name = azurerm_resource_group.hub-net.name
#}

