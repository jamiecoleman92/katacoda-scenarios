## Turn one of your Microservices Unhealthy

Now that your microservices are up and running and you have made sure that your requests are working, we can monitor the microservices’ health. Let’s start by making one of our microservices unhealthy. To do this, we need to hit a specific health endpoint provided by the MicroProfile specification, which allows you to make a service unhealthy:

`curl -X POST http://$IP:31000/api/name/unhealthy`{{execute}}

If you now check the health of your pods you should notice one of them has gone into a **Not ready** state.

`kubectl get pods`{{execute}}

Now if you send a request to the endpoint again you will notice it will not fail as your other microservice will now handle the request:

`curl http://$IP:31000/api/name`{{execute}}
