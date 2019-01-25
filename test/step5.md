## Test out the readiness Probe

Now wait until the name pod has recovered. This should take around 1 minute and will show the ready state when you run the following command:

`kubectl get pods`{{execute}}

Once it has recovered we are going to make both name pods unhealthy by making two post requests.

`curl -X POST http://$IP:31000/api/name/unhealthy`{{execute}}

`curl -X POST http://$IP:31000/api/name/unhealthy`{{execute}}

 If the response has the same pod name then wait 5 seconds and run the command again. This is because the readiness probe has not noticed the microservice has become unhealthy.

 Now check that both pods are no longer in a ready state:

 `kubectl get pods`{{execute}}

 You should soon notice that the ping microservice has also changed state. This is because the rediness probe for that pod has realized the name pod is no longer receiving requests and as such the ping microservice no longer works.

 After a small about of time if you keep running the above command you will notice the name pods recover and as such change state to ready. Then after another short amount of time the ping microservice will also become available.
