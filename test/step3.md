## Making requests to the microservices

Now our microservices are deployed and running with the **Ready** status we are ready to send some request to it.

First lets check the IP address of our minikube cluster by running the following command:

`minikube ip`{{execute}}

Now you need to set the variable IP to the IP address of your minikube cluster by running the following command:

`IP=$(minikube ip)`{{execute}}

Now replace the hostname in the command below with the IP address produced by the previous command to send a request to the microservice.

`curl http://$IP:31000/api/name`{{execute}}

You should see a response similar to the following:

**Hello! I'm container [container name]**

Similarly, navigate to `curl http://$IP:32000/api/ping/name-service`{{execute}} and observe a response with the content pong.
