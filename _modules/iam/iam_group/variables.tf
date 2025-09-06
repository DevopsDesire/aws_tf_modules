variable "group_name" {
  description = "The name of the IAM group"
  type        = string
}

variable "path" {
  description = "The path of the IAM group"
  type        = string
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