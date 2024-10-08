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
![Screenshot 2024-10-08 133120](https://github.com/user-attachments/assets/528cb0d1-7c51-473c-9bdf-be0db760d5f9)

6. Click Test to Configure test event

7. Click Add Trigger and select EventBridge(CloudWatch Events) to schedule the Lambda function.

8. Create New rule
![Screenshot 2024-10-08 134145](https://github.com/user-attachments/assets/8991930e-c85f-4391-a18b-eff98d9c3ef8)

9. Click Add to complete the trigger setup.
![Screenshot 2024-10-08 133206](https://github.com/user-attachments/assets/cfffe185-138d-4b0d-b146-93725386b2f4)

10. The EC2 instance has been successfully terminated.
![Screenshot 2024-10-08 133223](https://github.com/user-attachments/assets/3c705bf4-f0ac-42cc-80bc-3655c1dfde16)









