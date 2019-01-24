## Take a look at the deployment file provided

Firstly lets take a look at the provided file kubernetes.yaml that we will use to deploy our two Java microservices.

`cat kubernetes.yaml`{{execute}}

Here you can see two different deployments, one for each of our microservices. Here you can find information relating to the readiness probe provided by Kubernetes. This is what MicroProfile will use to test the state of the services.

Now lets just do a quick check to make sure our Kubernetes enviroment is up and running by executing the following command:

`kubectl get nodes`{{execute}}

If you see the master node status as not ready then you may have to wait 30 - 60 seconds then repeat the above command until it becomes available. Once it has the status **Ready** you can then move on to the next step.
