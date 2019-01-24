## Take a look at the deployment file provided

Firstly lets take a look at the provided file kubernetes.yaml that we will use to deploy our two Java microservices.

cat kubernetes.yaml {{execute}}

Here you can see two different deployments, one for each of our microservices. Here you can find information relating to the readiness probe provided by Kubernetes. This is what MicroProfile will use to test the state of the services.
