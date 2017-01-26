# HW1
## Devops Homework-1 Provisioning Servers

This readme will provide on howto provision servers on remote VM's using serice providers such as DigitalOcean and Amazon AWS. 

## Instructions on getting started
a. To get started, you will need to sign up with [DigitalOcean](https://cloud.digitalocean.com/registrations/new) and [Amazon AWS] (https://aws.amazon.com/premiumsupport/signup) .

b. Once you sign up with DigitalOcean, generate a token for your account and make sure to keep a record of the token. The instructions to that can be found [here](https://www.digitalocean.com/community/tutorials/how-to-use-the-digitalocean-api-v2).

c. Similarly you will need the Access and Secret token for AWS. The instructions to download these tokens can be found [here](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html).

d. You need to set these tokens in the code. The names of the these tokens are - 

```
DIG_OCEAN_TOKEN
AWS_ACCESS_KEY
AWS_SECRET_KEY
```
e. You need to generate ssh keys for DigitalOcean in your home directory of your machine. The instructions are available [here](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets). This will make sure your local machine is identified by the droplet.

f. Once you have generated ssh keys on your account then you will have to run this command. It will give you an ssh_id which you will have to include it in do/CreateDroplet.js#L35

```
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DIG_OCEAN_TOKEN" "https://api.digitalocean.com/v2/account/keys"
```

g. Next for AWS you need to import your id_rsa.pub key into your key-pair category in ec2 dashboard. And name that imported key as, "devop". If you want to change the name of the key, make sure you change it in code as well at aws/CreateInstance.js#L16. Follow these instructions to find where the key-pair [are] (http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).

## Requirements for the repository
This project need npm and node.js. These dependencies will be installed automatically by running the server_provision.sh shell script. 

## Steps to follow in order to provision the VM's
a. Clone this repository into your local system.

b. Run the following script to provision VMs for both Digital Ocean and AWS:

```
bash server_provision.sh
```

c. To configure nginx package using Ansible. Use these commands
```
cd ansible
ansible-playbook playbook.yml -i inventory
```

## Demo video explaining the procedure
[Server Provisioning] (https://www.youtube.com/watch?v=7i3DgrM9-uo&feature=youtu.be)

## Concept Questions
1. Define idempotency. Give two examples of an idempotent operation and non-idempotent operation.
   - Applying the same operation multiple times should result in the same state. In other words, A system should be able to reach a desired state, regardless of its current state.
   - Idempotent examples - In REST API, GET method. And also GIT PULL command. Both these examples will do the changes which they are suppose to do and will reach to the same state.
   - Non-Idempotent examples - PUT method and GIT PUSH command.
2. Describe several issues related to management of your inventory.
   - Dependency packages take a version name, if specified then there is a possibility that, that version is not available anymore. This will create problem.
   - If you don't specify a version then, there is a possibility that it will download latest one and then break the subsequent build process.
   - You will have to keep revising the package versions for a successful build.
3. Describe two configuration models. What are disadvantages and advantages of each model?
4. What are some of the consquences of not having proper configuration management?
