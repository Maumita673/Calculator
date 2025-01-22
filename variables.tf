variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID"
  default     = "ami-093a4ad9a8cc370f4" # Example AMI
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "my-demo-bucket"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}
