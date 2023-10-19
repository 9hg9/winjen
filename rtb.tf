## AWS1팀 한승완

## 라우팅 테이블 pub
resource "aws_route_table" "pub_rtb" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "pub_rtb"
  }
}

/*
## 라우팅 테이블 pri
resource "aws_route_table" "pri-2a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat1.id
  }

  tags = {
    Name = "pri-rtb-2a"
  }
}

resource "aws_route_table" "pri-2c" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat2.id
  }

  tags = {
    Name = "pri-rtb-2c"
  }
}

resource "aws_route_table" "pri2-2a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat1.id
  }

  tags = {
    Name = "pri2-rtb-2a"
  }
}

resource "aws_route_table" "pri2-2c" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat2.id
  }

  tags = {
    Name = "pri2-rtb-2c"
  }
}
*/

## 라우팅 테이블 서브넷 연결 pub
resource "aws_route_table_association" "pub-rtb-2a-1" {
  subnet_id      = aws_subnet.pub-2a.id
  route_table_id = aws_route_table.pub_rtb.id
}

resource "aws_route_table_association" "pub-rtb-2c-1" {
  subnet_id      = aws_subnet.pub-2c.id
  route_table_id = aws_route_table.pub_rtb.id
}

## 라우팅 테이블 서브넷 연결 pri
/*
resource "aws_route_table_association" "pri-rtb-2a-1" {
  subnet_id      = aws_subnet.pri-2a.id
  route_table_id = aws_route_table.pri-2a.id
}

resource "aws_route_table_association" "pri-rtb-2c-1" {
  subnet_id      = aws_subnet.pri-2c.id
  route_table_id = aws_route_table.pri-2c.id
}

resource "aws_route_table_association" "pri2-rtb-2a-1" {
  subnet_id      = aws_subnet.pri2-2a.id
  route_table_id = aws_route_table.pri2-2a.id
}

resource "aws_route_table_association" "pri2-rtb-2c-1" {
  subnet_id      = aws_subnet.pri2-2c.id
  route_table_id = aws_route_table.pri2-2c.id
}*/