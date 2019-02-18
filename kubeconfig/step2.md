## Making requests to the microservices

Issue the following command to check the health of your microservices:

`kubectl get pods`{{execute}}

You should see 0/1 besides the status **not ready**. This will change to 1/1 when your microservices is fully deployed and waiting for requests. Once this has happened you can move on to the next step.
Now your microservices are deployed and running with the **Ready** status you are ready to send some requests.

Firstly check the IP address of your Kubernetes cluster by running the following command:

`minikube ip`{{execute}}

Now you need to set the variable IP to the IP address of your Kubernetes cluster by running the following command:

`IP=$(minikube ip)`{{execute}}

Now when you run the following command that contains the required username and password, it will use the IP address of your cluster.

`curl -u bob:bobpwd http://$IP:31000/api/name`{{execute}}

You should see a response similar to the following:

**Hello! I'm container [container name]**

Similarly, navigate to `curl http://$IP:32000/api/ping/name-service`{{execute}} and observe a response with the content pong.
