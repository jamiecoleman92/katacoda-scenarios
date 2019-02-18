## Modifying the Name Microservice

Now your microservices are deployed and running with the **Ready** status you are ready to send some requests.

Firstly check the IP address of your Kubernetes cluster by running the following command:

`minikube ip`{{execute}}

Now you need to set the variable IP to the IP address of your Kubernetes cluster by running the following command:

`IP=$(minikube ip)`{{execute}}

Now when you run the following command it will use the IP address of your cluster.

`curl http://$IP:31000/api/name`{{execute}}

You should see a response similar to the following:

**Hello! I'm container [container name]**

Similarly, navigate to `curl http://$IP:32000/api/ping/name-service`{{execute}} and observe a response with the content pong.
