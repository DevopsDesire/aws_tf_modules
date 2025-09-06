variable "policy_name" {
  description = "The name of the IAM policy."
  type        = map(map(string))
}


variable "name_prefix" {
  description = "Prefix to add to the resource name."
  type        = string
}

variable "resource_type" {
  description = "The type of the resource."
  type        = string
  default     = "policy"
}

# variable "policy_path" {
#   description = "The path of the IAM policy."
#   type        = string
# }

# variable "policy_description" {
#   description = "The description of the IAM policy."
#   type        = string
# }

# variable "policy_document" {
#   description = "The policy document."
#   type        = string

# }

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}

}
