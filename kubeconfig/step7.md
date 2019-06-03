## Deploying your changes

Rebuild the application using the following commands:

`mvn package -pl system`{{execute}}

`mvn package -pl inventory`{{execute}}

Navigate to the root folder of the project located in the `start` directory.

`cd /guide-kubernetes-microprofile-config/start/`{{execute}}

Now you need to delete your old deployment then deploy your updated microservices by issuing the following commands:

`kubectl delete -f kubernetes.yaml`{{execute}}

`kubectl apply -f kubernetes.yaml`{{execute}}


After around 30 seconds, issue a curl command to http://[hostname]:31000/system/properties and you should see that the response headers have changed from `system` to `my-system`​.

`curl -u bob:bobpwd -D - http://$IP:31000/system/properties -o /dev/null`{{execute}}

Verify that http://[hostname]:32000/inventory/systems/system-service is working as intended. If it is not, then check the configuration of the credentials.

`curl -u bob:bobpwd http://$IP:32000/inventory/systems/system-service`{{execute}}
