
provider "aws" {
  region     = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-08d658f84a6d84a80"
  instance_type = "t2.micro"
  depends_on = ["aws_s3_bucket.example"]
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

# New resource for the S3 bucket our application will use.
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "mistry.cloud.test.terraforms3example"
  acl    = "private"
}
