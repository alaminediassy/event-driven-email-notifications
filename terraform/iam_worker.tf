data "aws_iam_policy_document" "worker_permissions" {
  statement {
    sid    = "ConsumeFromNotificationsQueue"
    effect = "Allow"

    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:ChangeMessageVisibility"
    ]

    resources = [
      aws_sqs_queue.notifications_queue.arn
    ]
  }

  statement {
    sid    = "SendEmailsWithSES"
    effect = "Allow"

    actions = [
      "ses:SendEmail",
      "ses:SendRawEmail"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "worker_permissions" {
  name        = "${local.name_prefix}-worker-permissions"
  description = "Allow worker to consume SQS messages and send emails with SES."
  policy      = data.aws_iam_policy_document.worker_permissions.json

  tags = local.common_tags
}