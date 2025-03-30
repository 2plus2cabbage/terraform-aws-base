![aws-base](https://github.com/2plus2cabbage/2plus2cabbage/blob/main/images/aws-base.png)

# AWS Windows Instance Terraform Deployment

Deploys a Windows Server 2022 VM in Amazon Web Services (AWS) with RDP and internet access.

## Files
The project is split into multiple files to illustrate modularity and keep separate constructs distinct, making it easier to manage and understand.
- `main.tf`: Terraform provider block (`hashicorp/aws`).
- `awsprovider.tf`: AWS provider config with `access_key`, `secret_key`, etc.
- `variables.tf`: Variables and locals for region, etc.
- `terraform.tfvars.template`: Template for sensitive/custom values; rename to `terraform.tfvars` and add your credentials.
- `locals.tf`: Local variables for naming conventions.
- `networking.tf`: VPC, subnet, internet gateway.
- `securitygroup.tf`: Security group for RDP (TCP 3389) and outbound traffic.
- `routing-static.tf`: Route table for internet access.
- `windows.tf`: Windows VM, outputs public/private IPs.

## How It Works
- **Networking**: VPC and subnet provide connectivity. Internet gateway and route table enable inbound/outbound traffic.
- **Security**: Allows RDP from your IP and all outbound traffic.
- **Instance**: Windows Server 2022 VM with public IP, firewall disabled via `user_data`.

## Prerequisites
- An AWS account with an IAM user having `AdministratorAccess`.
- An EC2 key pair created in AWS console, noting the `key_name`.
- Terraform installed on your machine.
- Examples are demonstrated using Visual Studio Code (VSCode).

## Deployment Steps
1. Update `terraform.tfvars` with AWS credentials, key pair name in `key_name`, and your public IP in `my_public_ip`.
2. Run `terraform init`, then (optionally) `terraform plan` to preview changes, then `terraform apply` (type `yes`).
3. Get the public IP from the `aws_vm_public_ip` output on the screen, or run `terraform output aws_vm_public_ip`, or check in the AWS Console under **EC2 > Instances**.
4. Get the initial password in the AWS Console under **EC2 > Instances > [click running instance] > Actions > Security > Get Windows Password**, using your key pair to decrypt.
5. Use Remote Desktop to log in with the `Administrator` user and initial password; change the password on first login.
6. To remove all resources, run `terraform destroy` (type `yes`).