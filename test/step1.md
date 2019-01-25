## Start up minikube

Firstly lets create our Kubernetes cluster using minikube. Execute the following command to get one set up:

`minikube start`{{execute}}

This will take around 30 seconds to complete.

Now lets just do a quick check to make sure our Kubernetes environment is up and running by executing the following command:

`kubectl get nodes`{{execute}}

If you see the minikube node status as not ready then you may have to wait 30 - 60 seconds for it to become available. Once it has the status **Ready** you can then move on to the next step.
