resource "aws_sqs_queue" "notifications_dlq" {
  name = "${local.name_prefix}-notifications-dlq"

  message_retention_seconds = 1209600

  tags = local.common_tags
}

resource "aws_sqs_queue" "notifications_queue" {
  name = "${local.name_prefix}-notifications-queue"

  visibility_timeout_seconds = var.sqs_visibility_timeout_seconds
  message_retention_seconds  = var.sqs_message_retention_seconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.notifications_dlq.arn
    maxReceiveCount     = var.sqs_max_receive_count
  })

  tags = local.common_tags
}