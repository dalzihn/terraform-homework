import boto3
import os
# import logging

# logger = logging.getLogger()
# logger.setLevel(logging.INFO)

s3 = boto3.client('s3')

target_bucket = os.environ['BUCKET_NAME']

def lambda_handler(event, context):

    source_bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    try:
        copy_source = {
            'Bucket': source_bucket,
            'Key': key
        }

        s3.copy_object(
            CopySource=copy_source,
            Bucket=target_bucket,
            Key=key
        )

        print(f"Copied {key} from {source_bucket} to {target_bucket}")

    except Exception as e:
        print(e)
        raise e