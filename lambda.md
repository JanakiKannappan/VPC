# AURA-33

## Mechanism to clean up instances & services that are in running state

### Step:1:
IAM Role Permissions:

The Lambda function needs the following permissions to manage EC2 instances:
ec2:DescribeInstances
ec2:TerminateInstances


### Step:2:
Create the Lambda Function:

1. Go to the AWS Lambda console.

2. Create a new Lambda function with Python 3.x as the runtime.

3. Attach the role
![Screenshot 2024-10-08 133717](https://github.com/user-attachments/assets/18239394-d2be-4327-8a72-b9155a78397d)

4. Click Create Function
![Screenshot 2024-10-08 133056](https://github.com/user-attachments/assets/ea25bc33-6f24-4a16-81b3-821b81f3e6ca)

5. Edit the code into the editor and click on Deploy to save the changes.
### To terminate instances in all region, deploy the below python code in lambda
```
import boto3

# Initialize AWS SDK (Boto3) client for EC2
ec2_client = boto3.client('ec2')

def terminate_all_running_instances_in_all_regions():
    # Get a list of all available regions
    regions_response = ec2_client.describe_regions()
    regions = [region['RegionName'] for region in regions_response['Regions']]

    for region in regions:
        print(f"Checking region: {region}")
        regional_ec2_client = boto3.client('ec2', region_name=region)
        
        # Get all running EC2 instances in the current region
        response = regional_ec2_client.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
        instances = [instance['InstanceId'] for reservation in response['Reservations'] for instance in reservation['Instances']]

        if not instances:
            print(f"No running instances found in region: {region}")
            continue
        
        # Terminate all running instances
        print(f"Terminating instances in {region}: {instances}")
        regional_ec2_client.terminate_instances(InstanceIds=instances)

def lambda_handler(event, context):
    terminate_all_running_instances_in_all_regions()
    
    return {
        'statusCode': 200,
        'body': "Terminated all running instances in all regions."
    }


```

### To terminate instances in specific region, deploy the below python code in lambda
```
import boto3

# Specify the region in which to terminate instances
REGION = 'eu-west-1'  # Replace with your desired region

# Initialize AWS SDK (Boto3) client for EC2
ec2_client = boto3.client('ec2', region_name=REGION)

def terminate_all_running_instances_in_region():
    # Get all running EC2 instances in the specified region
    response = ec2_client.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
    instances = [instance['InstanceId'] for reservation in response['Reservations'] for instance in reservation['Instances']]

    if not instances:
        print("No running instances found in region:", REGION)
        return
    
    # Terminate all running instances
    print(f"Terminating instances: {instances}")
    ec2_client.terminate_instances(InstanceIds=instances)

def lambda_handler(event, context):
    terminate_all_running_instances_in_region()
    
    return {
        'statusCode': 200,
        'body': f"Terminated all running instances in region {REGION}."
    }


```
![Screenshot 2024-10-08 133120](https://github.com/user-attachments/assets/528cb0d1-7c51-473c-9bdf-be0db760d5f9)

7. Click Test to Configure test event

8. Click Add Trigger and select EventBridge(CloudWatch Events) to schedule the Lambda function.

9. Create New rule

cron function for 8 pm IST
```
cron(30 14 ? * MON-FRI *)
```
![Screenshot 2024-10-08 134145](https://github.com/user-attachments/assets/8991930e-c85f-4391-a18b-eff98d9c3ef8)

11. Click Add to complete the trigger setup.
![Screenshot 2024-10-08 133206](https://github.com/user-attachments/assets/cfffe185-138d-4b0d-b146-93725386b2f4)

12. The EC2 instance has been successfully terminated.
![Screenshot 2024-10-08 133223](https://github.com/user-attachments/assets/3c705bf4-f0ac-42cc-80bc-3655c1dfde16)









