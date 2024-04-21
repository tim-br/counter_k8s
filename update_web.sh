# Define variables for deployment details
DEPLOYMENT_LABEL="app=caddy"
CONTAINER_NAME="caddy"
DESTINATION_PATH="/usr/share/caddy/"
SOURCE_PATH="./web/"

# Get the first pod name matching the deployment label
POD_NAME=$(kubectl get pods -l $DEPLOYMENT_LABEL -o jsonpath='{.items[0].metadata.name}')

# Copy files to the pod
pushd $SOURCE_PATH
kubectl cp ./ $POD_NAME:$DESTINATION_PATH -c $CONTAINER_NAME
popd
