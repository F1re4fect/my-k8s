# Create Dynamic Provision NFS Persistent Volumes

## Install on each client node

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt -y autoremove && sudo apt-get install -y nfs-common

# Setup Storage Node

kubectl create -f rbac.yaml -f class.yaml -f deployment.yaml
