variable "cidr_pub_subnet" {
    type = list(string)
    description = "cidr for public subnet"
    default = [ "10.0.1.0/24","10.0.2.0/24" ]
  
}

variable "cidr_pri_subnet" {
    type = list(string)
    description = "cidr for private subnet"
    default = [ "10.0.3.0/24","10.0.4.0/24","10.0.5.0/24" ]
  
}

variable "availability" {
    type = list(string)
    description = "Availability Zone"
    default = [ "ap-south-1a","ap-south-1b","ap-south-1c" ]
}