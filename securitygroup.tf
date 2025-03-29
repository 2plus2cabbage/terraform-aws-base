# Creates a security group to control traffic to the subnet
resource "aws_security_group" "cabbage_sg" {
  name                 = "${local.security_group_name_prefix}001"   # Name of the security group
  description          = "Security group for Windows VM"            # Description of the security group
  vpc_id               = aws_vpc.cabbage_vpc.id                     # VPC ID for the security group
  ingress {
    description        = "RDP from my IP"                           # Description of the ingress rule
    from_port          = 3389                                       # From port for RDP
    to_port            = 3389                                       # To port for RDP
    protocol           = "tcp"                                      # Protocol for RDP
    cidr_blocks        = [var.my_public_ip]                         # Source IP for RDP access
  }
  egress {
    from_port          = 0                                          # From port for outbound traffic
    to_port            = 0                                          # To port for outbound traffic
    protocol           = "-1"                                       # All protocols for outbound traffic
    cidr_blocks        = ["0.0.0.0/0"]                              # Allow all outbound destinations
  }
  tags = {
    Name               = "${local.security_group_name_prefix}001"   # Name tag for the security group
  }
}