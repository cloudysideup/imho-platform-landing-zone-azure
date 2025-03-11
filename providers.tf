provider "azurerm" {
  tenant_id       = "#{TF_AZ_TENANT_ID}#"
  subscription_id = "#{TF_AZ_SUBSCRIPTION_ID}#"
  features {}
}
