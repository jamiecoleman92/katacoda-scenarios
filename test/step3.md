## Making requests to the microservices

Now our microservices are deployed and running with the **Ready** status we are ready to send some request to it.

First lets check the IP address of our minikube cluster by running the following command:

`minikube ip`{{execute}}

Now replace the hostname in the command below with the IP address produced by the previous command to send a request to the microservice.

`curl http://[hostname]:31000/api/name`

You should see a response similar to the following:

**Hello! I'm container [container name]**

Once you have seen the above message in your terminal you can move to the next step.
