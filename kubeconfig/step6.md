## Updating Kubernetes resources

You will now update your Kubernetes deployments to set the environment variables in your containers, based on the values configured in the ConfigMap and Secret created previously. The env sections under the name-container and ping-container containers are where the environment variables will be set.

Replace the contents of the kubernetes.yaml file with the following:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: name-deployment
  labels:
    app: name
spec:
  selector:
    matchLabels:
      app: name
  template:
    metadata:
      labels:
        app: name
    spec:
      containers:
      - name: name-container
        image: name:1.0-SNAPSHOT
        ports:
        - containerPort: 9080
        # Set the GREETING environment variable
        env:
        - name: GREETING
          valueFrom:
            configMapKeyRef:
              name: greeting-config
              key: message
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ping-deployment
  labels:
    app: ping
spec:
  selector:
    matchLabels:
      app: ping
  template:
    metadata:
      labels:
        app: ping
    spec:
      containers:
      - name: ping-container
        image: ping:1.0-SNAPSHOT
        ports:
        - containerPort: 9080
        # Set the USERNAME and PASSWORD environment variables
        env:
        - name: USERNAME
          valueFrom:
            secretKeyRef:
              name: name-credentials
              key: username
        - name: PASSWORD
          valueFrom:
            secretKeyRef:
              name: name-credentials
              key: password
---
apiVersion: v1
kind: Service
metadata:
  name: name-service
spec:
  type: NodePort
  selector:
    app: name
  ports:
  - protocol: TCP
    port: 9080
    targetPort: 9080
    nodePort: 31000
---
apiVersion: v1
kind: Service
metadata:
  name: ping-service
spec:
  type: NodePort
  selector:
    app: ping
  ports:
  - protocol: TCP
    port: 9080
    targetPort: 9080
    nodePort: 32000
```

In the kubernetes.yaml file where the containers are defined, you can see the valueFrom field which allows you to specify the value of an environment variable from a variety of sources. These sources include a ConfigMap, a Secret, and information about the cluster. In this example configMapKeyRef gets the value message from the ConfigMap greeting-config. Similarly, secretKeyRef gets the values username and password from the Secret name-credentials.
