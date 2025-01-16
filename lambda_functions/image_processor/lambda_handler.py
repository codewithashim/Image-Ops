import json
import boto3
import uuid
import time

s3_client = boto3.client('s3')

def lambda_handler(event, context):
    print("Received event: " + json.dumps(event, indent=2))
    try:
        # Assume the API Gateway event has image upload body as base64 encoded
        image_data = event['body']

        # For demonstration, fake a process time
        time.sleep(1)
        unique_id = str(uuid.uuid4())
        # Create a fake processed image data
        processed_image_data = f'Processed Image Data {unique_id}'.encode('utf-8')

        bucket_name = "dev-s3-bucket"  # Replace with your bucket name in each environment
        file_name = f"processed-image-{unique_id}.txt"
        s3_client.put_object(Bucket = bucket_name, Key = file_name, Body = processed_image_data )



        return {
            'statusCode': 200,
            'body': json.dumps('Image processed successfully and stored in s3 with object key ' + file_name)
        }

    except Exception as e:
         print(f"Error processing image: {e}")
         return {
           'statusCode': 500,
           'body': json.dumps(f'Error processing image: {e}')
       }