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

output "api_access_key_id" {
  description = "API IAM access key id."
  value       = aws_iam_access_key.api.id
}

output "api_secret_access_key" {
  description = "API IAM secret access key."
  value       = aws_iam_access_key.api.secret
  sensitive   = true
}

output "worker_access_key_id" {
  description = "Worker IAM access key id."
  value       = aws_iam_access_key.worker.id
}

output "worker_secret_access_key" {
  description = "Worker IAM secret access key."
  value       = aws_iam_access_key.worker.secret
  sensitive   = true
}