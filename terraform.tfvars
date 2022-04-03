cidr_block_vpc = {
  cidr_block = "10.0.0.0/16"
  name = "terraform-vpc"
}

cidr_block_subnet_1 = {
  cidr_block = "10.0.10.0/24"
  name = "terraform-subnet"
}

cidr_block_subnet_2 = {
  cidr_block = "10.0.20.0/24"
  name = "terraform-subnet"
}


availability_zone = "us-east-1a"

private_key_location = "/home/galileo/.ssh/id_rsa"
public_key_location = "/home/galileo/.ssh/id_rsa.pub"