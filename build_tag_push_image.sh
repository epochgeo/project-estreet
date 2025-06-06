export aws_acc_id=$(aws sts get-caller-identity --query Account --output text)
echo using aws acc id: $aws_acc_id

docker compose up --build --force-recreate -d && docker compose down
docker tag project-estreet:latest $aws_acc_id.dkr.ecr.us-east-1.amazonaws.com/project-estreet
#aws ecr list-images --repository-name=project-estreet --region=us-east-1

docker push $aws_acc_id.dkr.ecr.us-east-1.amazonaws.com/project-estreet:latest

aws ecr list-images --repository-name=project-estreet --region=us-east-1

echo The latest image hashes should match...
