variable "name" {
    description = "The name of the IAM user"
    type        = string
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