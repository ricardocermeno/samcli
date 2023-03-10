
# AWS SAM CLI

This Dockerfile builds an image based on Alpine Linux for serverless development, that is why has packages installed like aws, aws sam, and esbuild to transpile typescript with lambdas functions.


## Usage/Examples

Common usage for development serverless with AWS SAM.

#### Build the AWS SAM application

```bash
docker run -it --rm  \
    --env-file .env \
    -v $(pwd):$(pwd) -w $(pwd) \
    ricardocermeno/samcli sam  build -p
```

#### Invoke a lambda function
```bash
docker run -it --rm  \
    --env-file .env \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):$(pwd) -w $(pwd) \
    ricardocermeno/samcli sam local invoke \
        --docker-volume-basedir  $(pwd)/.aws-sam/build -e event.json functionname
```

#### Deploy AWS SAM stack
```bash
docker run -it --rm  \
    --env-file .env \
    -v $(pwd):$(pwd) -w $(pwd) \
    ricardocermeno/samcli sam deploy --stack-name myStack
```