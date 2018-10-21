# Let's Encrypt AWS EC2 Traefik Example

This repository was created as a supplement to my Current Events assignment for SEIS 720: Computer Security to provide a working demonstration of the various challenge techniques used by Let's Encrypt.   The repository provides a working AWS Cloudformation template that initializes an EC2 instance with an IAM role configures with a policy that allows traefik to manage Route53 DNS.

## Prerequisites

- You need an AWS Account for this example to work.
- You must have already configured a Public Hosted Zone in AWS Route53.
- You must have already configured a SSH key pair in the Oregon (us-west-2) AWS Region.

## Limitations

Because this is only an example, I did not create an AMI mapping for all possible regions.  For that reason, you must deploy the AWS Cloudformation template in the Oregon (us-west-2) AWS Region.

## Provisioning the HTTP-01 Challenge Example:

- Create a new stack in the Oregon (us-west-2) region using the `aws.json` cloudformation template.
- SCP the `http-01.sh` file to the EC2 host.  `scp -i /path/to/ssh-key http-01.sh ubuntu@host.subdomain:~/`
- SCP the `http-01.yml` file to the EC2 host. `scp -i /path/to/ssh-key http-01.yml ubuntu@host.subdomain:~/`
- SSH into the EC2 host.  `ssh -i /path/to/ssh-key ubuntu@host.subdomain`
- On the EC2 host: `chmod 755 ./http-01.sh`
- On the EC2 host: `./http-01.sh`

## Provisioning the DNS-01 Challenge Example:

- Create a new stack in the Oregon (us-west-2) region using the `aws.json` cloudformation template.
- SCP the `dns-01.sh` file to the EC2 host.  `scp -i /path/to/ssh-key dns-01.sh ubuntu@host.subdomain:~/`
- SCP the `dns-01.yml` file to the EC2 host. `scp -i /path/to/ssh-key dns-01.yml ubuntu@host.subdomain:~/`
- SSH into the EC2 host.  `ssh -i /path/to/ssh-key ubuntu@host.subdomain`
- On the EC2 host: `chmod 755 ./dns-01.sh`
- On the EC2 host: `sudo ./dns-01.sh`