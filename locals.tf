locals {
  vpc_name                   = "vpc-${var.environment_name}-${var.location}-"             # Prefix for VPC name
  subnet_name_prefix         = "snet-${var.environment_name}-${var.location}-"            # Prefix for subnet name
  windows_name_prefix        = "vm-${var.environment_name}-${var.location}-windows-"      # Prefix for Windows VM name
  security_group_name_prefix = "sgroup-${var.environment_name}-${var.location}-"          # Prefix for security group name
  network_interface_prefix   = "nic-${var.environment_name}-${var.location}-"             # Prefix for network interface name
  public_ip_prefix           = "eip-${var.environment_name}-${var.location}-"             # Prefix for Elastic IP name
}