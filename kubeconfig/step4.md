## Modifying the Inventory Microservice

The inventory service is hardcoded to use bob and bobpwd as the credentials to authenticate against the name service. You’ll make these credentials configurable. In the Katacoda text editor, open the file /start/inventory/src/main/java/io/openliberty/guides/inventory/client/SystemClient.java and replace the two lines under `\\ Basic Auth Credentials` with the following

```java
  // Basic Auth Credentials
  @Inject
  @ConfigProperty(name = "SYSTEM_APP_USERNAME")
  private String username;

  @Inject
  @ConfigProperty(name = "SYSTEM_APP_PASSWORD")
  private String password;

```

The changes introduced here use MicroProfile Config and CDI to inject the value of the environment variables `SYSTEM_APP_USERNAME` and `SYSTEM_APP_PASSWORD` into the SystemClient class.
