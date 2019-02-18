## Deploy Java microservices

Now that you have your Kubernetes cluster up and running, you can deploy your microservices using the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}

While you are waiting for your services to start up, take a look at the provided kubernetes.yaml file that you will use to deploy your two Java microservices, by issuing the command below:

`cat kubernetes.yaml`{{execute}}

For each deployment, you can find information relating to the readiness probe, provided by Kubernetes, underneath the ‘readinessProbe’ attribute.

This Kubernetes readiness probe in these services are using MicroProfile health. Issue the following command to check the health of your pods:

`kubectl get pods`{{execute}}

You should see 0/1 besides the status **not ready**. This will change to 1/1 when your microservice is fully deployed and waiting for requests. Once this has happened you can move on to the next step.
