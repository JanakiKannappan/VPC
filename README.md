# AURA-186

### Create a Cloudwatch alarm incase of any Ec2 instance CPU reaches above 80%.


1. Created SNS(Simple Notification Service) topic:


![Screenshot 2024-08-28 150233](https://github.com/user-attachments/assets/cc43a77d-2e98-44ec-bf35-a8313a0ea746)

2. Created terraform script to create a cloudwatch alarm incase of any of the EC2 Instance CPU reaches 80%.

![Screenshot 2024-08-28 114540](https://github.com/user-attachments/assets/ad679e02-fd17-4aeb-ba45-72435212f200)

3. Created subscription, Subscribe your email to the SNS Topic:

![Screenshot 2024-08-28 151911](https://github.com/user-attachments/assets/34bf8a65-31eb-4354-8088-3efd988931d7)

4. Accept the confirmation subscription

![Screenshot 2024-08-28 150255](https://github.com/user-attachments/assets/c7d3db08-8f00-4678-aab4-83fd5e23ba70)
![Screenshot 2024-08-28 150344](https://github.com/user-attachments/assets/c8a79df4-5252-4afe-89c8-e9a04fc85cd7)

5. Cloud watch alarm created for both webapp and db instances:

![Screenshot 2024-08-28 114540](https://github.com/user-attachments/assets/789bf30f-8970-45f8-a2e1-9391859ff97e)

6. When the cpu reaches 80% cloudwatch alarm state changed to in alarm

![Screenshot 2024-08-28 151753](https://github.com/user-attachments/assets/42b93ba9-8d49-434a-8a76-03b1b4817ce9)
![Screenshot 2024-08-28 151655](https://github.com/user-attachments/assets/5444b9da-5c58-48b6-a11b-7e66a59b8c8c)

7. Email triggered when cpu reaches 80%

![Screenshot 2024-08-28 151725](https://github.com/user-attachments/assets/9c01c973-ecdc-4b73-af4e-154c8095da25)










