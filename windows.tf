# Creates a Windows Server 2022 VM instance in AWS
resource "aws_instance" "windows_instance" {
  ami                           = "ami-001adaa5c3ee02e10"                                                   # Windows Server 2022 in us-east-1
  instance_type                 = "t3.medium"                                                               # Instance type (compute resources)
  subnet_id                     = aws_subnet.cabbage_subnet.id                                              # Subnet for the VM
  vpc_security_group_ids        = [aws_security_group.cabbage_sg.id]                                        # Security group for the VM
  associate_public_ip_address   = true                                                                      # Assign a public IP for RDP access
  key_name                      = var.key_name                                                              # Key pair for password retrieval
  user_data                     = "<powershell>netsh advfirewall set allprofiles state off</powershell>"    # Disables firewall on boot
  tags = {
    Name                        = "${local.windows_name_prefix}001"                                         # Name of the Windows VM
  }
}

# Creates an Elastic IP for the Windows VM
resource "aws_eip" "cabbage_eip" {
  instance                      = aws_instance.windows_instance.id                                          # Instance to associate with the EIP
}

# Outputs the public IP of the Windows VM for RDP access
output "aws_vm_public_ip" {
  value                         = aws_eip.cabbage_eip.public_ip                                             # Public IP address of the VM
  description                   = "Public IP of the AWS Windows VM (Elastic IP)"                            # Description of the output
}

# Outputs the private IP of the Windows VM for internal networking
output "aws_vm_private_ip" {
  value                         = aws_instance.windows_instance.private_ip                                  # Private IP address of the VM
  description                   = "Private IP of the AWS Windows VM"                                        # Description of the output
}