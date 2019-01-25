## Making out Microservices Unhealthy

Now your microservices are up and running and you have made sure that you requests are working we now need to go and make one of our services unhealthy. We do this by hitting a specific health endpoint provided by the MicroProfile spec that allows you to make a service unhealthy.

`curl -X POST http://$IP:31000/api/name/unhealthy`{{execute}}

Now if you check the health of your pods you should notice one of them has gone into a **Not ready** state.

`kubectl get pods`{{execute}}

Now if you send a request to the endpoint again you will notice it will not fail as your other microservice will now handle the request:

`curl http://$IP:31000/api/name`{{execute}}
