# TODO: Designate a cloud provider, region, and credentials
provider "aws"{
  access_key="$ACCESS_KEY"
  secret_key="$SECRET_KEY"
  region="eu-west-1"

}

variable "subnet_public1" {
  description="Public subnet"
  default="subnet-0036ef5d93bb05a03"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "Udacity_T2" {
  count="4"
  ami="ami-0ea3405d2d2522162"
  instance_type="t2.micro"
  subnet_id="${var.subnet_public1}"
  tags={
    name="Project 2 - Udacity Terraform"
  }

}

# TODO: provision 2 m4.large EC2 instances named Udacity M4

resource "aws_instance" "Udacity_M4" {
  count="2"
  ami="ami-0ea3405d2d2522162"
  instance_type="m4.large"
  subnet_id="${var.subnet_public1}"
  tags={
    name="Project 2 - Udacity Terraform"
  }

}
