clean:
	find / -type d -name ".terraform" -exec rm -rf {} \;

ti: 
	terraform init
