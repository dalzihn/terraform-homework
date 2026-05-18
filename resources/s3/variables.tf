variable "s3_bucket_list" {
    type = object({
        bucket_name = string
        bucket_policy_json_path = string
    })
}

variable "s3_bucket_list_no_versioning" {
    type = object({
        bucket_name = string
        bucket_policy_json_path = string
    })
}