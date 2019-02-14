## Deploy Java microservices

Now that you have your Kubernetes cluster up and running, you can deploy your microservices using the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}

While you are waiting for your services to start up, take a look at the provided kubernetes.yaml file that you will use to deploy your two Java microservices, by issuing the command below:

`cat kubernetes.yaml`{{execute}}

For each deployment, you can find information relating to the readiness probe, provided by Kubernetes, underneath the ‘readinessProbe’ attribute.

Now you need to check the states of your pods. This is using the Kubernetes readiness probe that is using MicroProfile health by using the following command:

`kubectl get pods`{{execute}}

Now we need to wait until the pods are ready and once they are you can move onto the next step.
