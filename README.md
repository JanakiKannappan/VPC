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


5. When the cpu reaches 80% cloudwatch alarm state changed to in alarm

![Screenshot 2024-08-28 151753](https://github.com/user-attachments/assets/42b93ba9-8d49-434a-8a76-03b1b4817ce9)
![Screenshot 2024-08-28 151655](https://github.com/user-attachments/assets/5444b9da-5c58-48b6-a11b-7e66a59b8c8c)

6. Email triggered when cpu reaches 80%

![Screenshot 2024-08-28 151725](https://github.com/user-attachments/assets/9c01c973-ecdc-4b73-af4e-154c8095da25)

# AURA-66
### Route 53 implementation based on the customer domain
1. For testing used the Sample Domain in Godaddy.
![Screenshot (2)](https://github.com/user-attachments/assets/2ecdb6d2-439c-4585-9dad-de9938a69a9f)
2. Created Hosted zone in Route 53 , Created A record for route traffic to load balancer.
![Screenshot 2024-09-19 121809](https://github.com/user-attachments/assets/9e583b68-4d0d-481a-9e78-ccc11d3029fc)
3. Redirecting the request from http to https.
![Screenshot 2024-09-19 121032](https://github.com/user-attachments/assets/5852beb0-f5c3-4205-a49c-53c0cbf27416)
![Screenshot 2024-09-19 121126](https://github.com/user-attachments/assets/a1ab99d5-5fde-4140-b28f-6937c927e38c)
4. Requesting SSL Certificate for the Domain in ACM. Click Create record in route 53.
![Screenshot 2024-09-19 103211](https://github.com/user-attachments/assets/406d08e6-76ef-4cbc-a3a4-b07cc7be6936)
5. Domain tested and working properly.
![Screenshot 2024-09-19 121004](https://github.com/user-attachments/assets/b2abb8c2-784c-4090-bc2b-d176631b0bd2)



# AURA-64

### Route 53 -  setup for subdomain

1. Register the Targets in Target Group Region: Virginia
![Screenshot 2024-09-26 175808](https://github.com/user-attachments/assets/73623cdd-b412-4f73-aaa9-5dad471160cf)
2. Region: Mumbai
![Screenshot 2024-09-26 175830](https://github.com/user-attachments/assets/37769757-ce3c-4e7e-8867-fc612f00bc70)
3. In Route53, Create hosted zone
![Screenshot 2024-09-26 175934](https://github.com/user-attachments/assets/4cf8e229-90d6-4da5-918b-1b5b0971fd0f)
4. Copy and paste the ns record in Godaddy
![Screenshot 2024-09-26 180000](https://github.com/user-attachments/assets/7c56f48c-8782-4953-a27a-3f9b5428e065)
5. Request SSL Certificate in Mumbai region
![Screenshot 2024-09-26 180055](https://github.com/user-attachments/assets/7e2a2026-d476-415b-a716-f593620cf210)
and then create  record in route 53
7. Request SSL Certificate in Virginia region
![Screenshot 2024-09-26 180129](https://github.com/user-attachments/assets/6a6d0463-9012-42ef-8fe9-836b70e1f8ae)
and then create  record in route 53
![Screenshot 2024-09-26 180535](https://github.com/user-attachments/assets/b820e287-02fd-44f6-8caa-e14997b655f7)

9. Add listener and rule in both region
![Screenshot 2024-09-26 180306](https://github.com/user-attachments/assets/60359a89-9796-4b03-b148-a70f88622765)
![Screenshot 2024-09-26 180445](https://github.com/user-attachments/assets/d3050077-c00a-4f1a-93e3-a744d09fecdc)
10. Create Health check in Route53
![Screenshot 2024-09-26 180621](https://github.com/user-attachments/assets/6df443f1-28b0-42c9-8666-9a2feaba907c)

11.Create A record in Hosted zone for mumbai region
Enter sub domain name
Routing policy - Failover
record type- primary(first choice)
health check id
record id
![Screenshot 2024-09-26 180706](https://github.com/user-attachments/assets/fa3d1734-92ba-468e-8852-519e185a28ef)

12. Create A record in Hosted zone for virginia region
Enter sub domain name
Routing policy - Failover
record type- secondary(second choice)
health check id
record id
![Screenshot 2024-09-26 180733](https://github.com/user-attachments/assets/9bd90552-ddba-4bf2-ba76-1dccaa1c87c2)

It works 
13. ![Screenshot 2024-09-26 180816](https://github.com/user-attachments/assets/f870d049-bef7-4914-844b-bbff3e556abc)


14. If the health check fails in primary
![Screenshot 2024-09-26 181314](https://github.com/user-attachments/assets/d426b654-4cd4-48a0-8755-27e1b5e4b09e)
15. It redirect to another region
![image (2)](https://github.com/user-attachments/assets/9ac0aace-16f3-4359-bd46-d3126d4f4e96)













 













