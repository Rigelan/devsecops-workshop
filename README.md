# Prerequisites

We recommend that you provision about 5-10GBs of Memory per User.  For a workshop of 20 people, we recommend 4-6 m4.xlarge app nodes or larger.

 - Modern HTML5 Standard Compliant Web Browser
 - A recent stable version of Python 2.7 and the latest stable version of the boto libraries (lxml, pip, boto, boto3, and botocore)
 - The latest stable versions of Ansible.
 - An AWS account with the aws cli setup to use your access key
 - For best performance, ensure that the version of the oc cli you use matches the version of the OpenShift cluster. With matching versions users' lab content can and should provision in ~15-30 seconds. 

## Must have existing OpenShift 4.x Environment
You can user the OpenShift Install to provision an OpenShift Environment


# Environment Setup
## Provision OpenShift Users
Run the following script to create user accounts for your students.

cd scripts
./setup-users.sh -c <NUMBER_OF_STUDENTS> -a P@ssw0rd

This will provision OpenShift user accounts for each student and an OpenShift admin account with the provided password


## Quay
Use the Quay Operator to deply Quay in your OpenShift Environment.
>Note: Need to manually provision users

cd scripts/quay
./deploy-quay.sh

## CodeReady
Use the CodeReady Operator to deploy CodeReady in you OpenShift Environment

cd scripts/codeready
./deploy.sh

## Gogs
Provison a gogs deployment and then create gogs student accounts and populate with openshift-tasks project.

### Deploy Gogs

cd scripts
ansible-playbook setup-gogs.yml

### Create Student Repositorires
Once gogs has been deployed.

ansible-playbook setup-gogs-repos.yml

## Create Student Environments

### Create Student CICD Projects

cd scripts
ansible-playbook setup-cicd-playbook.yml

### Create Student working projects

cd scripts
ansible-playbook setup-students.yml

## Create Student Web Sites
Must have the AWS cli install and configured.

ansible-playbook setup-labs-website.yml

