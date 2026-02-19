output "notifications_queue_url" {
  description = "Main SQS queue URL."
  value       = aws_sqs_queue.notifications_queue.url
}

output "notifications_queue_arn" {
  description = "Main SQS queue ARN."
  value       = aws_sqs_queue.notifications_queue.arn
}

output "notifications_dlq_url" {
  description = "DLQ URL."
  value       = aws_sqs_queue.notifications_dlq.url
}

output "notifications_dlq_arn" {
  description = "DLQ ARN."
  value       = aws_sqs_queue.notifications_dlq.arn
}