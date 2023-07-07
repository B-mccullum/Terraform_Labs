# Use default VPC

variable "default_vpc_id" {
  description = "ID of your own default VPC"
  default     = "vpc-0cddd5dfa88aa5ab4"
}
# Create a security group variable

variable "security_group_name" {
  description = "week 20 security group"
  default     = "wk_20_secgr"
}

# Ubuntu instance AMI

variable "instance_ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-053b0d53c279acc90"
}

#  EC2 Instance type 
variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}
