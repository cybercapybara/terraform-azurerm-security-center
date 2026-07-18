resource "azurerm_security_center_subscription_pricing" "this" {
  for_each = var.resource_types

  resource_type = each.key
  tier          = each.value
}

resource "azurerm_security_center_contact" "this" {
  count = var.contact == null ? 0 : 1

  name                = var.contact.name
  email               = var.contact.email
  phone               = var.contact.phone
  alert_notifications = var.contact.alert_notifications
  alerts_to_admins    = var.contact.alerts_to_admins
}
