module "s3_bucket" {
    source = "../modules/s3_bucket"
    # S3 infor
    bucket_name = var.s3_bucket_list.bucket_name
    bucket_policy_json_path = var.s3_bucket_list.bucket_policy_json_path
}

module "s3_bucket_no_versioning" {
    source = "../modules/s3_bucket_no_versioning"
    # S3 infor
    bucket_name = var.s3_bucket_list_no_versioning.bucket_name
    bucket_policy_json_path = var.s3_bucket_list_no_versioning.bucket_policy_json_path
}