import json
import boto3
from botocore.exceptions import ClientError
from pprint import pprint
from time import sleep

# Define the database and table name created
def lambda_handler(event, context):
    print(event)
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('users')
    
    try:
        result = table.scan()
        data = result['Items']

        while 'LastEvaluatedKey' in result:
            result = table.scan(ExclusiveStartKey=result['LastEvaluatedKey'])
            data.extend(result['Items'])

    except ClientError:
        return {
            'statusCode': 404,
            'body': json.dumps({'error': 'User not found'})
        }
    else:
        return {
            'statusCode': 200,
            'body': str(data)
        }