## Creating a ConfigMap and Secret

There are several ways to configure an environment variable in a Docker container. You are going to use a ConfigMap and Secret to set these values. These are resources provided by Kubernetes that are used as a way to provide configuration values to your containers. A benefit is that they can be re-used across many different containers, even if they all require different environment variables to be set with the same value.


Create a ConfigMap to configure the greeting with the following kubectl command:

`kubectl create configmap greeting-config --from-literal message=Greetings...`{{execute}}

This command deploys a ConfigMap named greeting-config to your cluster. It has a key called `message` with a value of `Greetings…`. The `--from-literal` flag allows you to specify individual key-value pairs to store in this ConfigMap. Other available options, such as `--from-file` and `--from-env-file`, provide more versatility as to what you want to configure. Details about these options can be found in the Kubernetes CLI documentation.

Create a Secret to configure the credentials that ping will use to authenticate against name with the following kubectl command:

`kubectl create secret generic name-credentials --from-literal username=bob --from-literal password=bobpwd`{{execute}}

This command looks very similar to the command to create a ConfigMap, one difference is the word generic. It means that you’re creating a Secret that is generic, in other words it stores information that is not specialized in any way. There are different types of secrets, such as secrets to store Docker credentials and secrets to store public/private key pairs.

A Secret is similar to a ConfigMap, except a Secret is used for confidential information such as credentials. One of the main differences is that you have to explicitly tell kubectl to show you the contents of a Secret. Additionally, when it does show you the information, it only shows you a Base64 encoded version so that a casual onlooker doesn’t accidentally see any sensitive data. Secrets don’t provide any encryption by default, that is something you’ll either need to do yourself or find an alternate option to configure.
