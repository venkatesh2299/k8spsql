resource "aws_iam_policy" "task_role" {
  name = var.cw_policy_name
  path = "/"

  policy = jsondecode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:DescribeLogStreams"
            ],
            "Resource": "*"
        },
      ]
   })
}

resource "aws_iam_policy" "ssm" {
  name = var.ssm_policy_name
  path = "/"
  description = "permissions to fetch parameters of K8SEngineers"

policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeParameters"                
            ],
            "Resource": "*"
        },
         {
            "Effect": "Allow",
            "Action": [                
                "ssm:GetParameters"
            ],
            "Resource": "arn:aws:ssm:us-east-1:622917559821:parameter/*"
        }
    ]
})

}