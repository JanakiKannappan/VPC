#vpc
resource "aws_vpc" "vpc_aura" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_aura"
  }
}

#subnets
resource "aws_subnet" "publicsubnet" {
  count = length(var.cidr_pub_subnet)
  vpc_id     = aws_vpc.vpc_aura.id
  cidr_block = element(var.cidr_pub_subnet, count.index)
  availability_zone = element(var.availability, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "pub_sub ${count.index+1}"
  }
}

resource "aws_subnet" "privatesubnet" {
   count = length(var.cidr_pri_subnet)
  vpc_id     = aws_vpc.vpc_aura.id
  cidr_block = element(var.cidr_pri_subnet, count.index)
  availability_zone = element(var.availability, count.index)
  tags = {
    Name = "pri_sub ${count.index+1}"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.vpc_aura.id
  tags = {
    Name = "IGW"
  }
}


#route table
resource "aws_route_table" "Routetable" {
  vpc_id = aws_vpc.vpc_aura.id
  tags = {
    Name = "pub_rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Igw.id
  }

}

resource "aws_route_table_association" "RTassociation_pub" {
  count = length(var.cidr_pub_subnet)
  subnet_id      = element(aws_subnet.publicsubnet[*].id, count.index)
  route_table_id = aws_route_table.Routetable.id
}

#elastic ip
resource "aws_eip" "nat" {

  tags ={
    name = "eip_nat"

}
}

#nat gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = element(aws_subnet.publicsubnet[*].id, 1)

  tags = {
    Name = "gw NAT"
  }
}

#route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc_aura.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "pri_rt"
  }
}

resource "aws_route_table_association" "RTassociation_pri" {
  count = length(var.cidr_pri_subnet)
  subnet_id      = element(aws_subnet.privatesubnet[*].id, count.index)
  route_table_id = aws_route_table.private_rt.id
}

