## Modifying the System Microservice

The system service is hardcoded to have `system` as the app name. You’ll make this configurable by adding the appName member and X-App-Name header in the `start/name/src/main/java/io/openliberty/guides/name/NameResource.java` file with the following by using the provided text editor in Katacoda:

```java
package io.openliberty.guides.system;

// CDI
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
// JAX-RS
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.eclipse.microprofile.config.inject.ConfigProperty;

@RequestScoped
@Path("/properties")
public class SystemResource {

  @Inject
  @ConfigProperty(name = "APP_NAME")
  private String appName;

  @Inject
  @ConfigProperty(name = "HOSTNAME")
  private String hostname;

  @GET
  @Produces(MediaType.APPLICATION_JSON)
  public Response getProperties() {
    return Response.ok(System.getProperties())
      .header("X-Pod-Name", hostname)
      .header("X-App-Name", appName)
      .build();
  }
}
```

These changes use MicroProfile Config and CDI to inject the value of an environment variable called `APP_NAME` into the `appName` member of the `SystemResource class`.
