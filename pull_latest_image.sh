export aws_acc_id=$(aws sts get-caller-identity --query Account --output text)
echo using aws acc id: $aws_acc_id

docker pull $aws_acc_id.dkr.ecr.us-east-1.amazonaws.com/project-estreet:latest
