variable "access_key" {
  type        = string           # AWS access key, found in AWS console under IAM
  description = "AWS access key, found in AWS console under IAM"
}

variable "secret_key" {
  type        = string           # AWS secret key, found in AWS console under IAM
  description = "AWS secret key, found in AWS console under IAM"
}

variable "region" {
  type        = string           # AWS region for deployment
  description = "AWS region for deployment"
}

variable "environment_name" {
  type        = string           # Name for your environment, used in resource naming
  description = "Name for your environment, used in resource naming"
}

variable "location" {
  type        = string           # Location identifier, used in resource naming
  description = "Location identifier, used in resource naming"
}

variable "my_public_ip" {
  type        = string           # Your public IP for RDP access
  description = "Your public IP for RDP access"
}

variable "key_name" {
  type        = string           # Name of the key pair for password retrieval
  description = "Name of the key pair for password retrieval"
}