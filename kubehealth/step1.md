## Deploy Java microservices

Let's begin by ensuring our Kubernetes environment is set up by running the following command:

`kubectl version`{{execute}}

If the command returns the versions of your kubectl client and cluster, the environment is configured.  Otherwise, repeat the previous command until the command returns the versions.

Now that you have your Kubernetes cluster up and running, you can deploy your microservices using the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}

While you are waiting for your services to start up, take a look at the provided kubernetes.yaml file that you have used to deploy your two Java microservices, by issuing the command below:

`cat kubernetes.yaml`{{execute}}

Here you can see configuration for two deployments and two services. The first deployment `name-deployment` has two replicas which means it will have two pods running. We also specify the Docker image name and the container ports we would like to map outside the container, `9080`. This deployment contains a simple Java microservice that displays a brief greeting and the name of the container it runs in.

The second deployment `ping-deployment` does not specify any replicas as we only require one pod for this tutorial. This deployment pings the Kubernetes service that encapsulates the pod running the name microservice. This demonstrates how communication can be established between pods in your cluster.

For each deployment, you can find information relating to the readiness probe, provided by Kubernetes, underneath the ‘readinessProbe’ attribute. We have specified a delay of 15 seconds that will give the deployment sufficient time to start up. The polling period is set to 5 seconds so it will check the pods health every 5 seconds and if it gets one bad request it will mark that pod as unhealthy.

The Kubernetes readiness probes in these services are implemented using MicroProfile health. The two images that we are using for this tutorial have classes annotated with `@Health` that are integrated with CDI as shown in the code below taken from this service. It is a simple class that has a few methods one being to set a service as unhealthy so Kubernetes knows to no longer send traffic to it. Once you have had a look at the code below, please move on to the next step.

```
package io.openliberty.guides.name;

import java.time.LocalDateTime;

import javax.enterprise.context.ApplicationScoped;

import org.eclipse.microprofile.health.Health;
import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;

@Health
@ApplicationScoped
public class NameHealth implements HealthCheck {
    private static final int ALIVE_DELAY_SECONDS = 60;
    private static LocalDateTime aliveAfter = LocalDateTime.now();

    @Override
    public HealthCheckResponse call() {
        if (isAlive()) {
            return HealthCheckResponse.named("isAlive").up().build();
        }

        return HealthCheckResponse.named("isAlive").down().build();
    }

    public static void setUnhealthy() {
        aliveAfter = LocalDateTime.now().plusSeconds(ALIVE_DELAY_SECONDS);
    }

    private static boolean isAlive() {
        return LocalDateTime.now().isAfter(aliveAfter);
    }
}
```
