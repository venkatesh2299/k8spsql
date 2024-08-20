resource "aws_iam_role" "task_role" {
  name = var.task_role_name

  assume_role_policy = jsondecode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "StringEquals": {
                    "aws:SourceAccount": "622917559821"
                },
                "ArnLike": {
                    "aws:SourceArn": "arn:aws:ecs:us-east-1:622917559821:*"
                }
            }
        }
    ]
})
}