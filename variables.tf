variable "resource_types" {
  description = "Map of Defender for Cloud resource types to their pricing tier (Free or Standard), keyed by resource type (e.g. VirtualMachines, StorageAccounts)."
  type        = map(string)
  default     = {}

  validation {
    condition     = alltrue([for tier in values(var.resource_types) : contains(["Free", "Standard"], tier)])
    error_message = "Each pricing tier must be one of Free or Standard."
  }
}

variable "contact" {
  description = "Optional security contact for the subscription. Null disables contact creation."
  type = object({
    name                = string
    email               = string
    phone               = optional(string, null)
    alert_notifications = optional(bool, true)
    alerts_to_admins    = optional(bool, true)
  })
  default = null
}
