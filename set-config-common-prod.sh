#!/bin/bash          
echo "Starting to setup kubectl configs!"

K8S_APISERVER_DEMO=https://apiserver.us-central-1-selenium-demo.core.k8s.tgt

curl <YOUR REQUIRE CERT>.crt -o ~/.kube/YOURR_EQUIRED_CERT.crt

#################################
#  Function to setup config     #
#################################
function config_kubectl {
    kubectl config set-cluster $K8S_NAME --server=$K8S_APISERVER --certificate-authority=tgt-ca-bundle.crt
    #kubectl config set-cluster $K8S_NAME --server=$K8S_APISERVER --insecure-skip-tls-verify=true
    kubectl config set-context $K8S_NAME --cluster=$K8S_NAME --user=$K8S_NAME --namespace=$K8S_NAMESPACE
    kubectl config set-credentials $K8S_NAME --token=$K8S_TOKEN
}


config_kubectl

#PROD TTE CONFIG
K8S_APISERVER=$K8S_APISERVER_NPE_TTE
K8S_NAME=common-prod-tte
K8S_NAMESPACE=selenium-conference-2018-prod
K8S_TOKEN='YOUR TOKEN GOES HERE'

config_kubectl
