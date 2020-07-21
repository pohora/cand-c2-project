# TODO: Define the variable for aws_region
variable "aws_region" {
    type = string
    description = "AWS Region for terraform resources"
    default = "eu-west-1"
}

variable "greeting" {
    type = string
    description = "Greeting for Example lambda function"
    default = "Hello Udacity Team"
}