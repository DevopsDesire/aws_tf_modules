variable "policy_name" {
  description = "The name of the IAM policy."
  type        = string  
}

variable "policy_path" {
  description = "The path of the IAM policy."
  type        = string
}

variable "policy_description" {
  description = "The description of the IAM policy."
  type        = string
}

variable "policy_document" {
  description = "The policy document."
  type        = string
  
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
  
}
