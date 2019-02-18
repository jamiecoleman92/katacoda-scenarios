## Build and Deploy the Java microservices

Firstly lets just make sure our Kubernetes environment is set up by running the following command:

`kubectl version`{{execute}}

You should now see the versions of your kubectl client and cluster. If so your environment is all set up. If you do not see the version of your Kubernetes server wait a few moments and repeat the previous command until it is shown.

Now you need to navigate into the projects directory that has been provided for you:

`cd guide-kubernetes-microprofile-config/start/`{{execute}}

The two microservices you will deploy are called name and ping. The name microservice displays a brief greeting and the name of the container that it runs in. The ping microservice pings the Kubernetes Service that encapsulates the pod running the name microservice. The ping microservice demonstrates how communication can be established between pods inside a cluster. To build the applications with Maven, run the following commands;

`mvn package -pl name`{{execute}}

`mvn package -pl ping`{{execute}}

Once the services have been built you need to deploy them to Kubernetes. To do this use the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}
