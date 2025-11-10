variable "rgs" {

      type = map(object({
      name = string
      location = string
      managed_by = optional (string)
      tags =  {
        env = optional (map(string))
       } 
      }))
}
       