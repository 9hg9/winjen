## AWS1팀 한승완

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

variable "image_id" {
  description = "The image id"
  type        = string
  #default     = "ami-094efa69961183fa4" # Amazon Linux 2023 AMI # Quick start AMI
  default = ""
}

variable "db_security_group_name" {
  description = "The name of the DB"
  type        = string
  default     = "DB-SG"
}

variable "instance_type" {
  description = "The instance of image_id"
  type        = string
  default     = "t3.micro"
}

variable "alb_security_group_name" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "allow_http_alb"
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "tf-alb"
}