## Deploy our microservices

Now we have our Kubernetes node in a ready state we need to deploy our Java microservices.

`kubectl apply -f kubernetes.yaml`{{execute}}

Now we need to check the states of our pods by using the following command:

`kubectl get pods`{{execute}}

Now we need to wait until the pods are ready and once they are you can move onto the next step.
