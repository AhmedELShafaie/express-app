#!/bin/bash

set -e
set +x

date=$(date +"%d%m%Y_%H%M%S")
ARCHIVE_NAME="teleport_$date.tar.gz"
ARCHIVE_PATH="deployments/" # must end with a slash
S3_BUCKET="teleport-tests"
S3_KEY="$ARCHIVE_PATH$ARCHIVE_NAME"
S3_URL="s3://$S3_BUCKET/$S3_KEY"

# Deployment config
APPLICATION_NAME="Teleport"
DEPLOYMENT_GROUP="Teleport_Prod"
DEPLOYMENT_STRATEGY="CodeDeployDefault.OneAtATime"

profile=""
if [ "$#" -eq 2 ]; then
    profile="--profile $2"
fi

echo "s3 key = $S3_KEY"

tar -cvzf $ARCHIVE_NAME * --exclude=".git" --exclude="node_modules" > /dev/null

aws s3 cp $ARCHIVE_NAME $S3_URL

aws deploy push $profile --application-name "$APPLICATION_NAME" --s3-location $S3_URL
aws deploy create-deployment \
    $profile \
    --application-name "$APPLICATION_NAME" \
    --s3-location bucket=$S3_BUCKET,key=$S3_KEY,bundleType=zip \
    --deployment-group-name $DEPLOYMENT_GROUP \
    --deployment-config-name $DEPLOYMENT_STRATEGY

rm -f $ARCHIVE_NAME
