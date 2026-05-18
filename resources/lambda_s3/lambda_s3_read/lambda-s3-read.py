import boto3
# import logging

# logger = logging.getLogger()
# logger.setLevel(logging.INFO)

s3 = boto3.client('s3')

def lambda_handler(event, context):

    print("Event:", event)

    # Get the object from the event and show its content type
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    
    try:
        response = s3.get_object(Bucket=bucket, Key=key)
        version_id = event['Records'][0]['s3']['object']['versionId']
        print("VERSION ID:", version_id)
        return response['ContentType']
    except Exception as e:
        print(e)
        print("Error getting object {} from bucket {}. Make sure they exist and your bucket is in the same region as this function.".format(key, bucket))
        raise e