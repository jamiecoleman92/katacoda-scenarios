## Deploying your changes

Rebuild the application using the following commands:

`mvn package -pl name`{{execute}}

`mvn package -pl ping`{{execute}}

Navigate to the root folder of the project located in the `start` directory.

`cd /guide-kubernetes-microprofile-config/start/`{{execute}}

Now you need to delete your old deployment then deploy your updated microservices by issuing the following commands:

`kubectl delete -f kubernetes.yaml`{{execute}}

`kubectl apply -f kubernetes.yaml`{{execute}}


After around 30 seconds, issue a curl command to http://[hostname]:31000/api/name and you should see that the greeting message has changed from `Hello!` to `Greetings…`​.

`curl -u bob:bobpwd http://$IP:31000/api/name`{{execute}}

Verify that http://[hostname]:32000/api/ping/name-service is working as intended. If it is not, then check the configuration of the credentials.

`curl -u bob:bobpwd http://$IP:32000/api/ping/name-service`{{execute}}
