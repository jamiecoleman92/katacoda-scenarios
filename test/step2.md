## Deploy the microservices

Lets take a look at the provided file kubernetes.yaml that we will use to deploy our two Java microservices.

`cat kubernetes.yaml`{{execute}}

Here you can see two different deployments, one for each of our microservices. Here you can find information relating to the readiness probe provided by Kubernetes. This is what MicroProfile will use to test the state of the services.

Now we have our minikube cluster up and running we can deploy our microservices using the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}

Now we need to check the states of our pods by using the following command:

`kubectl get pods`{{execute}}

Now we need to wait until the pods are ready and once they are you can move onto the next step.
