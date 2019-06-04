## Making requests to the microservices

Issue the following command to check the health of your microservices:

`kubectl get pods`{{execute}}

You should see 0/1 besides the status **not ready**. This will change to 1/1 when your microservices is fully deployed and waiting for requests. Once this has happened you can move on to the next part of this step.
Now your microservices are deployed and running with the **Ready** status you are ready to send some requests.

Firstly check the IP address of your Kubernetes cluster by running the following command:

`minikube ip`{{execute}}

Now you need to set the variable IP to the IP address of your Kubernetes cluster by running the following command:

`IP=$(minikube ip)`{{execute}}

When you run the following command that contains the required username and password, it will use the IP address of your cluster.

`curl -u bob:bobpwd http://$IP:31000/system/properties`{{execute}}

You should see a response that will show you the JVM system properties of the running container.

Now if you run the following curl command it will only show you the response headers from the above request:

`curl -u bob:bobpwd -D - http://$IP:31000/system/properties -o /dev/null`{{execute}}

Take a note of the X-App-Name: `system`

Similarly, navigate to `curl http://$IP:32000/inventory/systems/system-service`{{execute}}. This request will add properties from the system microservice into the inventory microservice.
