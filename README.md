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
  
## Jenkins Manualy configuration
- Initial password
- JDK and Maven managed from 'Manage Jenkins' --> 'Global Tool Configuration'
- Install plugin Docker Pipeline and Maven Pipeline

## TODO for improve 
- Create playbook for install docker and configure docker's users.  
- Create playbook for install git to VMs for default images based Amz2 doesnt has Git installed.
- Create playbook for install kubectl  
  
## Troubleshooting
- Jenkins get stuck when run de pipeline with Docker service started. Solution: Change t2.micro for t2.small.
- 
## REFERENCES
- https://medium.com/@saaduddin26/configure-jenkins-with-ansible-54717131776

## Notes 

### Utils commands

kubectl scale deployment <namedeployment> --replicas=<number>
kubectl delete -f <path_file>
kubectl describe <resource> <name_resource>
kubectl logs <app_name>
helm repo add stable <url_repo>
helm search repo stable
helm install <unique_name> <chart>
helm uninstall 
helm upgrade <name> <folder_path>
helm history <name>
helm rollback <name> <version>


### -- More notes

By default Kubernetes will restart a container if it crashes for any reason.

Liveness probes: Used in Kubernetes to know when a pod is a live or dead. Kubernetes wil kill and recreate the pod when a liveness probe does not pass

Readiness probes: are used in kubernetes to know when a pod is ready to serve traffic.

livenessProbe field: determine how kubelet should check the container in order to consider wheter it is healthy or not.

### El ejemplo de HPA estuvo buenisimooooo
- Generate load trigger scaling
kubectl --generator=run-pod/v1 run -i --tty load-generator --image=busybox /bin/sh
while true; do wget -q -O - http://php-apache; done
kubectl get hpa -w
