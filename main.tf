provider "aws" {
    version = "~>2.0" 
    region = "us-east-1" 
}

provider "aws" {
    alias = "us-east-2"
    version = "~> 2.0" 
    region = "us-east-2" 
}

resource "aws_instance" "dev" {
    count = 1 
    ami = "ami-052efd3df9dad4825" 
    instance_type = "t2.micro" 
    key_name = var.key_name 
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["sg-0ffe27b2b2692d9ca","sg-00d9298e98858c1d1"]
}

resource "aws_instance" "dev4" {
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro" 
    key_name = var.key_name
    tags = {
        Name = "dev4"
    } 
    vpc_security_group_ids = ["sg-0ffe27b2b2692d9ca","sg-00d9298e98858c1d1"]
    depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev5"
    } 
    vpc_security_group_ids = ["sg-0ffe27b2b2692d9ca","sg-00d9298e98858c1d1"]
}

resource "aws_instance" "dev6" {
    provider = aws.us-east-2
    ami = var.amis["amazon-linux-us-east-2"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev6"
    } 
    vpc_security_group_ids = [aws_security_group.acesso-ssh-us-east-2.id]
}

resource "aws_instance" "dev7" {
    provider = aws.us-east-2
    ami = var.amis.amazon-linux-us-east-2
    instance_type = var.type_free_tier
    key_name = var.key_name
    tags = {
        Name = "dev7"
    } 
    vpc_security_group_ids = [aws_security_group.acesso-ssh-us-east-2.id]
}

resource "aws_s3_bucket" "dev4" {
    bucket = "vbonatti-dev4" 
    acl = "private" 

    tags = {
        Name = "vbonatti-dev4"
    }
}

resource "aws_dynamodb_table" "dynamodb-homolog" {
    provider = aws.us-east-2
    name = "GameScores"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "UserId"
    range_key = "GameTitle"

    attribute {
      name = "UserId"
      type = "S"
    }

    attribute {
      name = "GameTitle"
      type = "S"
    }
}