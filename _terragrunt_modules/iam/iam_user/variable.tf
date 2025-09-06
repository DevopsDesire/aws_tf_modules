variable "name_prefix" {
  description = "The prefix to use for the IAM user names"
  type        = string
}

variable "iam_name" {
  description = "The name of the IAM user"
  type        = map(string)
}

variable "path" {
  description = "The path for the IAM user"
  type        = string
  default     = "/"
}

variable "force_destroy" {
  description = "Whether to force destroy the IAM user"
  type        = bool
  default     = false
}


variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "resource_type" {
  description = "The type of the resource"
  type        = string
  default     = "iam"
}