# Use a python image from AWS
FROM public.ecr.aws/lambda/python:3.11

# Copy requirements.txt into the right directory for the lambda function
COPY requirements.txt ${LAMBDA_TASK_ROOT}

# Install the specified packages (and cache the downloaded packages)
RUN --mount=type=cache,target=/root/.cache/pip  pip install -r requirements.txt

# Copy function code
COPY lambda_function.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_function.handler" ]
