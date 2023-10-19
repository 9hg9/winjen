## AWS1팀 한승완

## VPC 생성
resource "aws_vpc" "main" {
  cidr_block           = "55.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "tf-vpc"
  }
}
## 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tf-igw"
  }
}
## public subnet 
resource "aws_subnet" "pub-2a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "55.0.0.0/24"
  availability_zone       = "ap-northeast-2a" ## 가용영역 지정
  map_public_ip_on_launch = "true"            ## 퍼블릭 ip 활성화

  tags = {
    Name = "tf-pub-2a-1"
  }
}

resource "aws_subnet" "pub-2c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "55.0.3.0/24"
  availability_zone       = "ap-northeast-2c" ## 가용영역 지정
  map_public_ip_on_launch = "true"            ## 퍼블릭 ip 활성화

  tags = {
    Name = "tf-pub-2c-1"
  }
}



## private 서브넷 생성
resource "aws_subnet" "pri-2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "55.0.1.0/24"
  availability_zone = "ap-northeast-2a" ## 가용영역 지정

  tags = {
    Name = "tf-pri-2a-1"
  }
}

resource "aws_subnet" "pri-2c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "55.0.4.0/24"
  availability_zone = "ap-northeast-2c" ## 가용영역 지정

  tags = {
    Name = "tf-pri-2c-1"
  }
}

resource "aws_subnet" "pri2-2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "55.0.2.0/24"
  availability_zone = "ap-northeast-2a" ## 가용영역 지정

  tags = {
    Name = "tf-pri-2a-1"
  }
}

resource "aws_subnet" "pri2-2c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "55.0.5.0/24"
  availability_zone = "ap-northeast-2c" ## 가용영역 지정

  tags = {
    Name = "tf-pri-2c-1"
  }
}

/*
##Nat gateway 생성
resource "aws_eip" "nat_ip" {
  domain = "vpc"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.pub-2a.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

##Nat2 gateway 생성
resource "aws_eip" "nat2_ip" {
  domain = "vpc"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.nat2_ip.id
  subnet_id     = aws_subnet.pub-2c.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}*/