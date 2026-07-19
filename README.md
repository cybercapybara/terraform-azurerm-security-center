# terraform-azurerm-security-center

Terraform module that configures [Microsoft Defender for Cloud](https://azure.microsoft.com/products/defender-for-cloud)
(formerly Azure Security Center) at the subscription level. It sets the pricing
tier for a map of resource types and, optionally, configures a security contact
for alert notifications.

## Usage

```hcl
module "security_center" {
  source = "github.com/moveeeax/terraform-azurerm-security-center"

  resource_types = {
    VirtualMachines = "Standard"
    StorageAccounts = "Standard"
  }

  contact = {
    name  = "security-team"
    email = "security@example.com"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| azurerm   | >= 3.0   |

## Inputs

| Name             | Description                                                              | Type          | Default | Required |
|------------------|--------------------------------------------------------------------------|---------------|---------|:--------:|
| `resource_types` | Map of resource types to their pricing tier (Free or Standard).          | `map(string)` | `{}`    |    no    |
| `contact`        | Optional security contact for the subscription.                          | `object`      | `null`  |    no    |

## Outputs

| Name          | Description                                                        |
|---------------|--------------------------------------------------------------------|
| `pricing_ids` | Map of resource types to their Defender for Cloud pricing IDs.      |
| `contact_id`  | ID of the security center contact, if one was created.             |

## License

[MIT](LICENSE)
