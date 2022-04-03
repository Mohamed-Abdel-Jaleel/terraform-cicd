variable "cidr_block_vpc" {
  description = "cidr blok and tag for vpc"
  type = object(
    {
      cidr_block = string
      name       = string
    }
  )
}

variable "cidr_block_subnet_1" {
  description = "cidr blok and tag for subnet"
  type = object(
    {
      cidr_block = string
      name       = string
    }
  )
}


variable "cidr_block_subnet_2" {
  description = "cidr blok and tag for subnet"
  type = object(
    {
      cidr_block = string
      name       = string
    }
  )
}

variable "availability_zone" {}