resource "aws_iam_user" "api" {
  name = "${local.name_prefix}-api"
  tags = local.common_tags
}

resource "aws_iam_user" "worker" {
  name = "${local.name_prefix}-worker"
  tags = local.common_tags
}

resource "aws_iam_user_policy_attachment" "api_policy" {
  user       = aws_iam_user.api.name
  policy_arn = aws_iam_policy.api_sqs_publish.arn
}

resource "aws_iam_user_policy_attachment" "worker_policy" {
  user       = aws_iam_user.worker.name
  policy_arn = aws_iam_policy.worker_permissions.arn
}
resource "aws_iam_access_key" "api" {
  user = aws_iam_user.api.name
}

resource "aws_iam_access_key" "worker" {
  user = aws_iam_user.worker.name
}