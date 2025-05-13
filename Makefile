clean:
	find / -type d -name ".terraform" -exec rm -rf {} \;

ti: 
	terraform init

all: 
	terraform init
	terraform apply -auto-approve
