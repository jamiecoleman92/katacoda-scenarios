## Deploying the microservices

The two microservices you will deploy are called name and ping. The name microservice displays a brief greeting and the name of the container that it runs in. The ping microservice pings the Kubernetes Service that encapsulates the pod running the name microservice. The ping microservice demonstrates how communication can be established between pods inside a cluster. To build these applications run the following command:

`mvn package`{{execute}}

When the build succeeds, run the following command to deploy the necessary Kubernetes resources to serve the applications:

`kubectl apply -f kubernetes.yaml`{{execute}}

Now you need to check the states of our pods by using the following command:

`kubectl get pods`{{execute}}

You need to wait until the pods are ready and once they are you can move onto the next step.
