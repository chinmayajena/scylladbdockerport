# Use the official ScyllaDB image as the base image
FROM scylladb/scylla

# Copy the custom configuration file into the container
COPY scylla.yaml /etc/scylla/

# Expose the custom CQL port
EXPOSE 9142
