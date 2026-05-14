clean:
	find / -type d -name ".terraform" -exec rm -rf {} \;

ti: 
	terraform init

all: 
	terraform init
	terraform apply -auto-approve

td: 
	terraform destroy -auto-approve

virginia: 

	terraform workspace new virginia || terraform workspace select virginia &&\
	terraform apply -var-file regions/us-east-1.tfvars -auto-approve 

dvirginia:
	
	terraform workspace new virginia && terraform workspace select virginia &&\
	terraform destroy -var-file regions/us-east-1.tfvars -auto-approve  
	

ohio:

	terraform workspace new ohio || terraform workspace select ohio 
	terraform apply -var-file regions/us-east-2.tfvars -auto-approve

