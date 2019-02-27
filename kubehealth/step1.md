## Deploy Java microservices

Lets begin by ensuring our Kubernetes environment is set up by running the following command:

`kubectl version`{{execute}}

If the command returns the versions of your kubectl client and cluster, the environment is configured.  Otherwise, repeat the previous command until the command returns the versions.

Now that you have your Kubernetes cluster up and running, you can deploy your microservices using the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}

While you are waiting for your services to start up, take a look at the provided kubernetes.yaml file that you will use to deploy your two Java microservices, by issuing the command below:

`cat kubernetes.yaml`{{execute}}

For each deployment, you can find information relating to the readiness probe, provided by Kubernetes, underneath the ‘readinessProbe’ attribute.

This Kubernetes readiness probe in these services are using MicroProfile health. Issue the following command to check the health of your pods:

`kubectl get pods`{{execute}}

The microservices are fully deployed and ready for requests when the `READY` column indicates `1/1` for each deployment.  Repeat the previous command until all deployments are ready before continuing to the next step.
