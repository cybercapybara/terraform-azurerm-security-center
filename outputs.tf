output "pricing_ids" {
  description = "Map of resource types to their Defender for Cloud pricing resource IDs."
  value       = { for k, v in azurerm_security_center_subscription_pricing.this : k => v.id }
}

output "contact_id" {
  description = "ID of the security center contact, if one was created."
  value       = try(azurerm_security_center_contact.this[0].id, null)
}
