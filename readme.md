## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.44.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.44.1 |
| <a name="provider_random"></a> [random](#provider\_random) | ~>3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_app.tft](https://registry.terraform.io/providers/hashicorp/azurerm/3.44.1/docs/resources/container_app) | resource |
| [azurerm_container_app_environment.tft](https://registry.terraform.io/providers/hashicorp/azurerm/3.44.1/docs/resources/container_app_environment) | resource |
| [azurerm_log_analytics_workspace.tft](https://registry.terraform.io/providers/hashicorp/azurerm/3.44.1/docs/resources/log_analytics_workspace) | resource |
| [azurerm_resource_group.tft](https://registry.terraform.io/providers/hashicorp/azurerm/3.44.1/docs/resources/resource_group) | resource |
| [random_pet.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | `"Australia East"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app-connect"></a> [app-connect](#output\_app-connect) | n/a |