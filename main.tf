module "buckets" {

  source = "./bucket"

  buckets = ["videos", "images", "website", "users"]

}

module "ec2" {
  source = "./ec2"

  for_each = { for k, v in local.servers : k => v }

  name = each.value.name
  type = each.value.type
  size = each.value.size
}