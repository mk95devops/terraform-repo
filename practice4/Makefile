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

	terraform workspace new virginia || terraform select virginia
	terraform apply -var-file regions/us-east-1.tfvars -auto-approve 

dvirginia:
	
	terraform destroy -var-file regions/us-east-1.tfvars -auto-approve 
	terraform workspace select default && terraform workspace delete virginia 

ohio:

	terraform workspace new ohio || terraform select ohio 
	terraform apply -var-file regions/us-east-2.tfvars -auto-approve

