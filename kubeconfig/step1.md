## Build and Deploy the Java microservices

To begin, make sure your Kubernetes environment is set up. Once the terminal has finished outputting messages and is ready for input it should be setup. To confirm it is ready please run the following command:

`kubectl version`{{execute}}

You should now see the versions of your kubectl client and cluster. If so, your environment is all set up. If you do not see the version of your Kubernetes server wait a few moments and repeat the previous command until it is shown.

Now you need to navigate into the projects directory that has been provided for you. You may notice their is a finish directory. This contains the finished code that you will not require for this tutorial.

`cd guide-kubernetes-microprofile-config/start/`{{execute}}

The two microservices you will deploy are called system and inventory. The system microservice returns JVM properties information about the container it is running in. The inventory microservice adds the properties from the system microservice into the inventory. This demonstrates how communication can be established between pods inside a cluster. To build the applications with Maven, run the following commands one after the other:

`mvn package -pl system`{{execute}}

`mvn package -pl inventory`{{execute}}

Once the services have been built, you need to deploy them to Kubernetes. To do this use the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}
