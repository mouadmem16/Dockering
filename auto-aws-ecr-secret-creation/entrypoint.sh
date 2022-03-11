#!bin/sh

echo "SECRET TOKEN CREATION STARTING ...";

TOKEN=$(aws ecr get-authorization-token --output text --query authorizationData[].authorizationToken | base64 -d | cut -d: -f2)

kubectl delete secret --ignore-not-found $SECRET_NAME -n $NAMESPACE

kubectl create secret docker-registry $SECRET_NAME --docker-server=$ECR_REPO_URL --docker-username=AWS --docker-password=$TOKEN -n $NAMESPACE

echo "SECRET TOKEN CREATION TERMINATED ...";
