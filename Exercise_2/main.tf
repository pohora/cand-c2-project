provider "aws"{
  access_key="$ACCESS_KEY"
  secret_key="$SECRET_KEY"
  region=var.aws_region

}


resource "aws_lambda_function" "greeting_lambda"{
    function_name = "greet_lambda"
    handler = "greet_lambda.lambda_handler"
    runtime = "python3.6"
    filename = "function.zip"
    source_code_hash = "${filebase64sha256("function.zip")}"
    role = "${aws_iam_role.greeting_lambda_exec_role.arn}"

    environment{
        variables={
            greeting="Hello Udacity Team!"
        }
    }
}


resource "aws_iam_role" "greeting_lambda_exec_role" {
    name = "greeting_lambda_exec_role"
    assume_role_policy = "${file("iam/lambda_policy.json")}"
}

resource "aws_iam_policy" "lambda_logging"{
  name = "lambda_logging"
  path = "/"
  policy = "${file("iam/lambda_logging_policy.json")}"
}

resource "aws_iam_role_policy_attachment" "lambda_logging_policy_attach" {
  role = "${aws_iam_role.greeting_lambda_exec_role.name}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}

