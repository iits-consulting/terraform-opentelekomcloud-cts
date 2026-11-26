variable "tags" {
  type        = map(string)
  default     = null
  description = "Common tags to add to resources that support them."
}

variable "bucket_name" {
  type        = string
  description = "OBS Bucket name to store the traces (will be created automatically)."
}

variable "file_prefix" {
  type        = string
  default     = "cts"
  description = "Object name prefix to store the traces in the OBS. Default: cts"
}

variable "cts_expiration_days" {
  type        = number
  default     = 180
  description = "How long should the data be preserved within the OBS bucket (in days). Default: 180"
}

variable "enable_trace_analysis" {
  type        = bool
  default     = true
  description = "Enables/disable trace analysis (LTS) for the tracker. Default: true"
}

variable "kms_key_rotation_interval" {
  type        = number
  description = "Rotation interval in days (30-365) for the KMS key created by this module. Setting a value enables automatic key rotation. null turns rotation off, also on a key where it was enabled outside of Terraform. (default: null)"
  default     = null
  validation {
    condition     = var.kms_key_rotation_interval == null ? true : var.kms_key_rotation_interval >= 30 && var.kms_key_rotation_interval <= 365
    error_message = "kms_key_rotation_interval not in range 30 <= x <= 365"
  }
}
