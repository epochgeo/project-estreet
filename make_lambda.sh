export aws_acc_id=$(aws sts get-caller-identity --query Account --output text)
echo using aws acc id: $aws_acc_id

aws lambda create-function \
  --function-name test-polars \
  --package-type Image \
  --code ImageUri=$aws_acc_id.dkr.ecr.us-east-1.amazonaws.com/polars-test:latest \
  --role arn:aws:iam::$aws_acc_id:role/lambda-ex
