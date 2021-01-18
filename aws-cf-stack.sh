#!/usr/bin/bash

REGION="us-west-2"
ACTION=$1
STACKNAME=$2
TEMPLATE=$3
PARAMS=$4

if [ $ACTION == "create" ] || [ $ACTION == "Create" ] || [ $ACTION == "CREATE" ] ; then
    echo "Creating stack $STACKNAME in region $REGION"
	aws cloudformation create-stack \
	--stack-name $STACKNAME \
	--template-body file://$TEMPLATE \
	--parameters file://$PARAMS \
	--region $REGION \
	${@:5}
	
	echo "Waiting for stack to be created"
	aws cloudformation wait stack-create-complete \
	--region $REGION \
	--stack-name $STACKNAME

elif [ $ACTION == "update" ] || [ $ACTION == "Update" ] || [ $ACTION == "UPDATE" ] ; then
    echo "Updating stack $STACKNAME in region $REGION"
	aws cloudformation update-stack \
	--stack-name $STACKNAME
	--template-body file://$TEMPLATE \
	--parameters file://$PARAMS \
	--region $REGION \
	${@:5}
	
	echo "Waiting for stack to be updated"
	aws cloudformation wait stack-update-complete \
	--region $REGION \
	--stack-name $STACKNAME

elif [ $ACTION == "delete" ] || [ $ACTION == "Delete" ] || [ $ACTION == "DELETE" ] ; then
    echo "Deleting stack $STACKNAME in region $REGION"
	aws cloudformation delete-stack \
	--stack-name $STACKNAME \
	--region $REGION
	
	echo "Waiting for stack to be deleted"
	aws cloudformation wait stack-delete-complete \
	--region $REGION \
	--stack-name $STACKNAME

elif [ $ACTION == "list" ] || [ $ACTION == "List" ] || [ $ACTION == "LIST" ] ; then
    echo "List"
	aws cloudformation list-stacks \
	--region $REGION

elif [ $ACTION == "describe" ] || [ $ACTION == "Describe" ] || [ $ACTION == "DESCRIBE" ] ; then
    echo "Checking for stack $STACKNAME"
	if ! aws cloudformation describe-stacks --region $REGION --stack-name $STACKNAME ; then
		echo "Stack $STACKNAME does not exist in $REGION"
	fi
else
	echo "Argument for ACTION to take not understood"
	exit 0
fi
