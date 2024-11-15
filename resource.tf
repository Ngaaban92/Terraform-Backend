# Resource: EC2 Instance
resource "aws_instance" "myec2" {
  ami           = var.my-ami
  instance_type = var.instance-type["uat"]
  user_data     = file("${path.module}/tla.sh")
  tags = {
    "Name" = var.instance-name
  }
}

resource "aws_s3_bucket" "tlabucket" {
  bucket = "mytfbucket-tla-statefile001"

  tags = {
    Name        = "MyTFState"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "tla-bucket" {
  bucket = aws_s3_bucket.tlabucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tla-bucket-encryption" {
  bucket = aws_s3_bucket.tlabucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "tla-table" {
  name         = "tla-state-lock"
  hash_key     = "LockId"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockId"
    type = "S"
  }

}