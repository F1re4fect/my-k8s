STEP 1:

kubectl edit configmap -n kube-system kube-proxy

apiVersion: kubeproxy.config.k8s.io/v1alpha1 kind: KubeProxyConfiguration mode: "ipvs" ipvs: strictARP: true

STEP 2:

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml

On first install only

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

STEP 3:

kubectl apply -f https://raw.githubusercontent.com/carterfieldslabs/k8s/master/metallb/metallb-config.yaml

or

sudo cat <<EOF | kubectl create -f - apiVersion: v1 kind: ConfigMap metadata: namespace: metallb-system name: config data: config: | address-pools: - name: default protocol: layer2 addresses: - 192.168.222.51-192.168.222.75

EOF
