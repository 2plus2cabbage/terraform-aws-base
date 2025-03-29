# Creates a route table to direct traffic from the subnet to the internet
resource "aws_route_table" "cabbage_route_table" {
  vpc_id               = aws_vpc.cabbage_vpc.id                             # VPC ID for the route table
  route {
    cidr_block         = "0.0.0.0/0"                                        # Route all traffic
    gateway_id         = aws_internet_gateway.cabbage_igw.id                # Direct to internet gateway
  }
  tags = {
    Name               = "rt-${var.environment_name}-${var.location}-001"   # Name of the route table
  }
}

# Associates the route table with the subnet for internet access
resource "aws_route_table_association" "cabbage_subnet_route" {
  subnet_id            = aws_subnet.cabbage_subnet.id                       # Subnet to associate with the route table
  route_table_id       = aws_route_table.cabbage_route_table.id             # Route table to associate with the subnet
}