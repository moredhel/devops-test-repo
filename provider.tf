provider "azurerm" {
  version = "~> 1.40.0"
}

provider "cloudflare" {
  version = "~> 2.0.0"
  email   = data.azurerm_key_vault_secret.cloudflare_api_email.value
  api_key = data.azurerm_key_vault_secret.cloudflare_api_key.value
}

provider "apigee" {
  base_uri = "https://api.enterprise.apigee.com"
  org = "grandvision"
  user = var.apigee_user
  password = var.apigee_password
}

provider "algolia" {
  alias          = "testing"
  version        = "~> 0.3"
  application_id = data.azurerm_key_vault_secret.algolia_application_id-testing.value
  api_key        = data.azurerm_key_vault_secret.algolia_api_key-testing.value
}

provider "algolia" {
  alias          = "acceptance"
  version        = "~> 0.3"
  application_id = data.azurerm_key_vault_secret.algolia_application_id-acceptance.value
  api_key        = data.azurerm_key_vault_secret.algolia_api_key-acceptance.value
}

provider "algolia" {
  alias          = "production"
  version        = "~> 0.3"
  application_id = data.azurerm_key_vault_secret.algolia_application_id-production.value
  api_key        = data.azurerm_key_vault_secret.algolia_api_key-production.value
}

provider "null" {
  version = "~> 2.1"
}

terraform {
  backend "azurerm" {
    storage_account_name = "gvterraform"
    container_name       = "tfstate"
    key                  = "aoeuaoeu.terraform.tfstate"
  }
}
