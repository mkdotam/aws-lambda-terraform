PWD=/Users/mk/code/lambda/

.PHONY: help
help:
	@echo "Help is coming..."
	@echo "Available commands are:"
	@echo " - make init 	: to initalize python virtual environment"
	@echo " - make format 	: calls formatter and pep8 linter"
	@echo " - make test 	: runs pytests"
	@echo " - make build 	: builds the lambda for deployment, executed by terraform"
	@echo " - make plan 	: run terraform init & plan for you"
	@echo " - make deploy 	: run terraform apply for you"
	@echo " - make destroy	: run terraform destroy for you"
	@echo "Enjoy and have fun."
	

.PHONY: init
init:
	./scripts/make-init.sh


.PHONY: format
format:
	@echo "Brushing up the python code."
	black $(PWD)src $(PWD)tests
	flake8 $(PWD)src $(PWD)tests

	@echo "...and let's make terraform code beautiful too."
	cd $(PWD)tf && terraform fmt

.PHONY: test
test:
	pytest $(PWD)tests/test.py


.PHONY: build
build:
	rm -rf $(PWD)build/*
	pip install -r $(PWD)src/requirements.txt -t $(PWD)build/
	cp -r $(PWD)src/* $(PWD)build/


.PHONY: plan
plan:
	cd $(PWD)tf && terraform init && terraform plan 


.PHONY: deploy
deploy: 
	cd $(PWD)tf && terraform apply


.PHONY: destroy
destroy: 
	cd $(PWD)tf && terraform destroy
