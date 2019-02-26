## Modifying the Name Microservice

The name service is hardcoded to have "Hello! I'm container {container name}"" as the greeting message. You’ll make this message configurable by replacing the NameResource class in the start/name/src/main/java/io/openliberty/guides/name/NameResource.java file with the following by using the provided text editor in Katacoda:

```java
package io.openliberty.guides.name;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.config.inject.ConfigProperty;

@RequestScoped
@Path("/")
public class NameResource {

    @Inject
    @ConfigProperty(name = "GREETING")
    private String greeting;

    @Inject
    @ConfigProperty(name = "HOSTNAME")
    private String hostname;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getContainerName() {
        return greeting + " I'm container " + hostname + "\n";
    }

}
```

These changes use MicroProfile Config and CDI to inject the value of an environment variable called GREETING into the greeting member of the NameResource class.
