# hello_world_api

This is a standard "Hello World" API hosted on AWS. As of now it only supports GET operations but that can easily be expanded to handle POST, PUT, etc.

### AWS Architecture

The API is handled via AWS API Gateway

The function logic for the response is integrated via AWS Lambda Node.js

### CI/CD

The CI/CD is handled via CircleCI and as of now only has one environment and one build/deployment stage with multiple jobs within the pipeline. It also contains one simple test written in bash to ensure the api is responding correctly via curl.

### Terraform

It is deployed via Terraform based on the graph below:
<br/><br/>
![Graph](./images/graphviz.svg)
