## Deploy Java microservices

Lets begin by ensuring our Kubernetes environment is set up by running the following command:

`kubectl version`{{execute}}

If the command returns the versions of your kubectl client and cluster, the environment is configured.  Otherwise, repeat the previous command until the command returns the versions.

Now that you have your Kubernetes cluster up and running, you can deploy your microservices using the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}

While you are waiting for your services to start up, take a look at the provided kubernetes.yaml file that you will use to deploy your two Java microservices, by issuing the command below:

`cat kubernetes.yaml`{{execute}}

Here you can see configuration for two deployments and two services. The first deployment `name-deployment` has two replicas which means it will have two pods running. We also specify the Docker image name and the container ports we would like to map outside the container `9080`. This deployment contains a simple Java Microservice that displays a brief greeting and the name of the container it runs in.

The second deployment `ping-deployment` does not specify any replicas as we only require one pod for this tutorial. This deployment pings the Kubernetes service that encapsulates the pod running the name microservice. This demonstrates how communication can be established between pods in your cluster.

For each deployment, you can find information relating to the readiness probe, provided by Kubernetes, underneath the ‘readinessProbe’ attribute. We have specified a delay of 15 seconds that will give the deployment time to start up. The polling period is set to 5 seconds so it will check the pods health every 5 seconds and if it gets one bad request it will mark that pod as unhealthy.

This Kubernetes readiness probe in these services are using MicroProfile health. Issue the following command to check the health of your pods:

`kubectl get pods`{{execute}}

The microservices are fully deployed and ready for requests when the `READY` column indicates `1/1` for each deployment.  Repeat the previous command until all deployments are ready before continuing to the next step.
