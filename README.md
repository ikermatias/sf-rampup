# sf-rampup


## Creating Packer VM

Into packer/ directory we found  
packer  
|__jenkinsVM.json  
|__jenkinsVM_vars.json  
  
The first file describe all the configuration needed for create an artifact (AMI) that its configuration management is make with Ansible.  Ansible install and configure Jenkins Server.  
The second file describe all varaibles values configured in jenkinsVM.json.  
  
Run  ```  packer build -var-file=<path_to_vars_value_file>  ``` for build the image.  
Also you could add ``` | tee packer.log ``` for storage execution log.

## Creating Terraform

## 
## REFERENCES
- https://medium.com/@saaduddin26/configure-jenkins-with-ansible-54717131776
