data "aws_iam_policy_document" "api_sqs_publish" {
  statement {
    sid     = "PublishToNotificationsQueue"
    effect  = "Allow"
    actions = ["sqs:SendMessage"]
    resources = [
      aws_sqs_queue.notifications_queue.arn
    ]
  }
}

resource "aws_iam_policy" "api_sqs_publish" {
  name        = "${local.name_prefix}-api-sqs-publish"
  description = "Allow API to publish messages to SQS."
  policy      = data.aws_iam_policy_document.api_sqs_publish.json

  tags = local.common_tags
}