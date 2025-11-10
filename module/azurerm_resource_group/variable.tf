variable "rgs" {

  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    env        = optional(string)
    tags       = optional(map(string))
  }))
}
       
