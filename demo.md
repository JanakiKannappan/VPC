## Prerequisites
1. Install terraform

2. Install AWS CLI

3. Create Access key and secret key from aws iam service

4. Configure your AWS CLI with your access and secret key
   ```
   AWS Configure
   ```
5. Before starting to deploy the infrastructure ensure you have a proper permission from the admistrator

## Create Infrastructure using terraform

1. Open terminal, Clone the Repositority
```
git clone https://github.com/atomedgesoft/aura-cloud.git
```
2. Go to the folder by using cd command
```
cd aura-cloud
```
3. Initiate terraform inside the cloned repository
```
terraform init
```
4. optional, if you dont have workspace, Create workspace
```
terraform workspace new dev
```
```
terraform workspace new stage
```
```
terraform workspace new prod
```
5. Select the workspace
```
terraform workspace select <environment name>
```
4. Execute terraform plan command to create a dry run for your infra
```
terraform plan
```
5. While applying the infra specify the region which we want, for now we are using mumbai(ap-south-1)
```
terraform apply -var="region=ap-south-1" --auto-approve  
```

## Steps to run the Frontend pipepline

1. Open terminal, Clone the Repositority
```
git clone https://github.com/atomedgesoft/terraform-pipeline-aura-frontend-deploy.git
```
2. Go to the folder by using cd command
```
cd terraform-pipeline-aura-frontend-deploy
```
3. Initiate terraform inside the cloned repository
```
terraform init
```
```
terraform plan
```
```
terraform apply -var="region=ap-south-1" --auto-approve  
```

## Steps to run the aura-app pipepline

1. Open terminal, Clone the Repositority
```
git clone https://github.com/atomedgesoft/terraform-pipeline-aura-app-deploy.git
```
2. Go to the folder by using cd command
```
cd terraform-pipeline-aura-app-deploy
```
3. Initiate terraform inside the cloned repository
```
terraform init
```
```
terraform plan
```
```
terraform apply -var="region=ap-south-1" --auto-approve  
```

## Steps to run the postgres pipepline

1. Open terminal, Clone the Repositority
```
git clone https://github.com/atomedgesoft/terraform-pipeline-aura-postgres-deploy.git
```
2. Go to the folder by using cd command
```
cd terraform-pipeline-aura-postgres-deploy
```
3. Initiate terraform inside the cloned repository
```
terraform init
```
```
terraform plan
```
```
terraform apply -var="region=ap-south-1" --auto-approve  
```
