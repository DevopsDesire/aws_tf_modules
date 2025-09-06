variable "group_name" {
  description = "The name of the IAM group"
  type        = map(map(string))
}



variable "name_prefix" {
  description = "Prefix to add to the resource name."
  type        = string
}

variable "resource_type" {
  description = "The type of the resource."
  type        = string
  default     = "group"
}

variable "policy_arns" {
  description = "The ARN of the IAM policy to attach to the group"
  type        = list(string)
  default     = []

}

variable "attach_policy" {
  description = "Whether to attach the policy to the group"
  type        = bool
  default     = false

}

variable "attach_user" {
  description = "Whether to attach the user to the group"
  type        = bool
  default     = false

}

variable "user_names" {
  description = "The names of the IAM users to attach to the group"
  type        = list(string)
  default     = []

}