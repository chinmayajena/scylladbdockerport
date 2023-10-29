# How to run Scylladb in different port

Running ScyllaDB inside a Docker container with a custom CQL port requires a few modifications. You would need to set the appropriate configuration options and expose the necessary ports in your Dockerfile and when you run the Docker container.

Here’s how you can achieve this:

### Step 1: Create a Custom ScyllaDB Configuration File

Create a custom `scylla.yaml` file with the `native_transport_port` set to your desired port. For example:

```yaml
native_transport_port: 9142
```

### Step 2: Create a Dockerfile

Create a Dockerfile to build your ScyllaDB image. In this Dockerfile, you will copy your custom `scylla.yaml` file into the image and expose the custom CQL port.

```Dockerfile
# Use the official ScyllaDB image as the base image
FROM scylladb/scylla

# Copy the custom configuration file into the container
COPY scylla.yaml /etc/scylla/

# Expose the custom CQL port
EXPOSE 9142
```

### Step 3: Build Your Docker Image

Run the following command in the directory containing your Dockerfile and custom `scylla.yaml` file:

```sh
docker build -t my-scylladb-image .
```

This command builds your Docker image and tags it as `my-scylladb-image`.

### Step 4: Run Your ScyllaDB Container

After building the image, you can run a container from it, making sure to map the custom CQL port:

```sh
docker run -p 9142:9142 --name my-scylladb-container -d my-scylladb-image
```

In this command:

- `-p 9142:9142` maps port 9142 on your host to port 9142 on the container.
- `--name my-scylladb-container` sets the name of your container.
- `-d` runs the container in detached mode.

### Step 5: Verify Connectivity

You can now connect to ScyllaDB using the CQL port `9142`.

```sh
cqlsh <Docker_Host_IP> 9142
```

Replace `<Docker_Host_IP>` with the IP address of your Docker host.

By following these steps, you will have a Dockerized ScyllaDB instance running with a CQL port different from the default `9042`. Ensure that the port is open and accessible from your client's location.
