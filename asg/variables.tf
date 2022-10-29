variable "env" {
  type        = string
  description = "this varaible represents the environment"
  default     = "dev"
}

variable "instance_type" {
  type        = string
  description = "this varaible represents the size of EC2"
  default     = "t2.micro"
}

variable "max_size" {
  type        = number
  description = "this varaible represents the max size of ec2"
  default     = 5
}

variable "min_size" {
  type        = number
  description = "this varaible represents the min size of ec2"
  default     = 2
}

variable "desired_size" {
  type        = number
  description = "this varaible represents the desired size of ec2"
  default     = 2
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "subnet to create ec2 on"
  default     = ["subnet-01e52e38768cfb1b2", "subnet-0dadacb12c2714c21"]
}

variable "ingress_ports" {
  type        = list(string)
  description = "Variable for ingress ports"
  default     = ["22", "80"]
}

variable "pub_subnet_cidrA" {
  type        = string
  description = "cidr block of public subnet"
  default     = "10.0.1.0/24"
}

variable "pub_subnet_cidrB" {
  type        = string
  description = "cidr block of public subnet"
  default     = "10.0.2.0/24"
}

variable "pub_subnet_cidrC" {
  type        = string
  description = "cidr block of public subnet"
  default     = "10.0.3.0/24"
}

variable "private_subnet_cidrA" {
  type        = string
  description = "cidr block of private subnet"
  default     = "10.0.11.0/24"
}

variable "private_subnet_cidrB" {
  type        = string
  description = "cidr block of private subnet"
  default     = "10.0.12.0/24"
}

variable "private_subnet_cidrC" {
  type        = string
  description = "cidr block of private subnet"
  default     = "10.0.13.0/24"
}