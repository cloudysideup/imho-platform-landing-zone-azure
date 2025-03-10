provider "azurerm" {
  client_id       = "#{TF_AZ_SPN_CLIENT_ID}#"
  subscription_id = "#{TF_AZ_SUBSCRIPTION_ID}#"
  tenant_id       = "#{TF_AZ_TENANT_ID}#"
  features {}
}
