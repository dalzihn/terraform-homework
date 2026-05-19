import boto3
import os
import json
import csv
from io import StringIO
from datetime import datetime

s3 = boto3.client('s3')

target_bucket = os.environ['TARGET_BUCKET']
target_folder = os.environ['TARGET_FOLDER']

REQUIRED_FIELDS = ['name', 'email', 'createdate', 'status']


def lambda_handler(event, context):

    source_bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    # Check file extension
    if not key.endswith('.json'):
        print(f"{key} is not a JSON file")
        return

    try:
        # Read JSON file from S3
        response = s3.get_object(
            Bucket=source_bucket,
            Key=key
        )

        file_content = response['Body'].read().decode('utf-8')

        data = json.loads(file_content)

        # Validate required fields
        for field in REQUIRED_FIELDS:
            if field not in data:
                raise ValueError(f"Missing required field: {field}")

        # Validate status
        if data['status'].lower() != 'active':
            raise ValueError("Status is not active")

        # Create CSV in memory
        csv_buffer = StringIO() # Used to treat something as a file-like object

        writer = csv.DictWriter(
            csv_buffer,
            fieldnames=REQUIRED_FIELDS
        )

        writer.writeheader()
        writer.writerow({
            'name': data['name'],
            'email': data['email'],
            'createdate': data['createdate'],
            'status': data['status']
        })

        # Generate filename YYYYMMDD.csv
        csv_filename = f"{datetime.now().strftime('%Y%m%d')}.csv"

        # Upload CSV to target bucket
        s3.put_object(
            Bucket=target_bucket,
            Key=f"{target_folder}/{csv_filename}",
            Body=csv_buffer.getvalue(),
            ContentType='text/csv'
        )

        print(f"CSV uploaded: {csv_filename} to {target_bucket}/{target_folder}")

    except Exception as e:
        print(e)
        raise e