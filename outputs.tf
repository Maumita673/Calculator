output "instance_id" {
  value = aws_instance.demo_instance.id
}

output "bucket_name" {
  value = aws_s3_bucket.demo_bucket.id
}

output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}
