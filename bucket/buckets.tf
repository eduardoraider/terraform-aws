resource "aws_s3_bucket" "golang-bucket" {
  for_each = toset(var.buckets)

  bucket = "terraform-wookye-bucket-${each.value}"

  tags = {
    Name = "Wookye Terraform Tests"
  }
}

resource "aws_s3_bucket_ownership_controls" "golang-bucket-ownership" {
  for_each = toset(var.buckets)
  bucket = aws_s3_bucket.golang-bucket[each.key].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "golang-bucket-acl" {
  for_each = toset(var.buckets)
  depends_on = [aws_s3_bucket_ownership_controls.golang-bucket-ownership]

  bucket = aws_s3_bucket.golang-bucket[each.key].id
  acl = "private"
}
