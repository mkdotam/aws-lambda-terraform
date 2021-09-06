# Example of standalone AWS Lambda (with requirements) provisioned by Terraform

In this repo you will find a very simple standalone AWS Python Lambda, which has a dependency in requirements.txt and is being fully provisioned by terraform.

I assume that you have installed Python3 and pip on your local machine. And you have created AWS account and have configured AWS. 

Before proceeding with terraform let's make sure you have installed [direnv](https://direnv.net), and you have created a valid `.envrc` file from the example file you have in the repo. You will need to export your AWS_PROFILE name, that you're using in your `~/.aws/config`, so whenever you will `cd` in this directory, codes would be deployed to correct AWS account.

## How To:

### 1. Initalization

You will need to run command: 
```
make init
```

It will create a virtual environment in `.env` folder, and will install project requirements. 
Afer that you will need to inizalize virutal environment by running:
```
source .env/bin/activate
``` 

### 2. Playing with things python

Now you should be able to run python format checker and linter and tests, by running following make commands:
```
make format
```
and 
```
make test
```

### 3. Playing with all things terraform

Now, to run terraform commands you can change current directory to `./tf` and run terraform as usual, or just use `make` commands:
```
make plan
```

When prompted give the name of the beforehand created S3 bucket, which you will use to store state remotely. Then run: 
```
make deploy
```

After you will provision this lambda example to your AWS account you can destroy it by running:

```
make destroy
```

Enjoy and have fun.

PS. and don't forget to run `terraform fmt` to format you terraform code when needed :)

---

Disclaimer: All codes are provided as is, you bear full responsibility for how you use them. 