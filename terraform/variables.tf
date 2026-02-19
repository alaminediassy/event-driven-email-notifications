variable "project_name" {
  description = "Project name used to prefix AWS resources"
  type        = string
  default     = "event-driven-email-notifications"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-west-3"
}

variable "sqs_visibility_timeout_seconds" {
  description = "Time (in seconds) a message stays invisible after being received"
  type        = number
  default     = 30
}

variable "sqs_message_retention_seconds" {
  description = "How long messages are kept in the queue"
  type        = number
  default     = 345600
}

variable "sqs_max_receive_count" {
  description = "Number of retries before sending the message to the DLQ."
  type        = number
  default     = 5
}