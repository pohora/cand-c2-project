# TODO: Define the output variable for the lambda function.

output "lambda_arn" {
    value = "${aws_lambda_function.greeting_lambda.qualified_arn}"
}
