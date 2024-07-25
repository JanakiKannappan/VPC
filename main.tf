#vpc
resource "aws_vpc" "vpc_aura" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_aura"
  }
}

#subnet
resource "aws_subnet" "publicsubnet1" {
  vpc_id     = aws_vpc.vpc_aura.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "pub_sub1"
  }
}

resource "aws_subnet" "publicsubnet2" {
  vpc_id     = aws_vpc.vpc_aura.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "pub_sub2"
  }
}

resource "aws_subnet" "privatesubnet1" {
  vpc_id     = aws_vpc.vpc_aura.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "pri_sub1"
  }
}

resource "aws_subnet" "privatesubnet2" {
  vpc_id     = aws_vpc.vpc_aura.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "pri_sub2"
  }
}

resource "aws_subnet" "privatesubnet3" {
  vpc_id     = aws_vpc.vpc_aura.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "pri_sub3"
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

resource "aws_route_table_association" "RTassociation1" {
  subnet_id      = aws_subnet.publicsubnet1.id
  route_table_id = aws_route_table.Routetable.id
}


resource "aws_route_table_association" "RTassociation2" {
  subnet_id      = aws_subnet.publicsubnet2.id
  route_table_id = aws_route_table.Routetable.id
}

#elastic ip
resource "aws_eip" "nat" {

  tags ={
    name = "eip_nat"

}
}

#nat gw
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.publicsubnet1.id

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

resource "aws_route_table_association" "RTassociation3" {
  subnet_id      = aws_subnet.privatesubnet1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "RTassociation4" {
  subnet_id      = aws_subnet.privatesubnet2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "RTassociation5" {
  subnet_id      = aws_subnet.privatesubnet3.id
  route_table_id = aws_route_table.private_rt.id
}

