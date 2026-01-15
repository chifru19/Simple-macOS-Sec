# Security Group for F2 Task - Enforcing Least Privilege
resource "aws_security_group" "f2_security_group" {
  name        = "F2-Secure-Access"
  description = "Restricted access for internal management"
  vpc_id      = var.vpc_id # Best practice: Associate with a specific VPC

  # INBOUND: Only allow SSH from a specific internal network
  ingress {
    description = "SSH from internal CIDR only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Prevents public internet access (0.0.0.0/0)
  }

  # OUTBOUND: Allow all traffic out (Standard for updates/patches)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "F2-Task-Security-Group"
    Environment = "Production"
  }
}
