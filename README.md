## my-k8s

#### STEP 1:

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook addtosudoers.yml -i hosts.yml -u cloudadmin --extra-vars "ansible_sudo_pass="

#### STEP 2:

ansible-playbook server-updates.yml -i hosts.yml

#### STEP 3:

ansible-playbook -i hosts.yml k8s-prereq.yml
ansible-playbook -i hosts.yml k8s-cluster.yml

#### STEP 4:

ansible-playbook -i hosts.yml k8s-nfs.yml

ansible-playbook -i hosts.yml k8s-metallb.yml

ansible-playbook -i hosts.yml k8s-istio.yml

ansible-playbook -i hosts.yml k8s-ecr-renew.yml

ansible-playbook -i hosts.yml k8s-jenkins.yml

ansible-playbook -i hosts.yml k8s-sonarqube.yml

#### NOTES:

ansible-playbook -i hosts.yml server-updates.yml --ask-pass --extra-vars='pubkey="id_rsa.pub"'

ansible-playbook -i hosts.yml -v -b -c ssh --ask-pass server-updates.yml --extra-vars='pubkey="id_rsa.pub"'

export ANSIBLE_HOST_KEY_CHECKING=False

https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/

https://github.com/ctienshi/kubernetes-ansible

https://github.com/kairen/kubeadm-ansible

https://medium.com/faun/how-to-create-your-own-kubernetes-cluster-using-ansible-7c6b5c031a5d

ansible all -i hosts.yml -u cloudadmin -m ping

ansible all -i hosts -u cloudadmin -m setup

#### Generate PW

sudo apt install whois

mkpasswd -m sha-512

ansible-playbook installdocker.yml -i hosts --extra-vars "ansible_sudo_pass="


sudo kubeadm init --control-plane-endpoint "192.168.222.40" --upload-certs --pod-network-cidr=10.244.0.0/16
