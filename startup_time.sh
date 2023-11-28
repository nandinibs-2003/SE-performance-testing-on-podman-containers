# Record the start time
start_time=$(date +%s.%N)

# Start the Podman container
podman run -d --name hello-world-applic hello-world

# Record the end time
end_time=$(date +%s.%N)

# Calculate the elapsed time
elapsed_time=$(echo "$end_time - $start_time" | bc)

# Print the elapsed time
echo "Container started in ${elapsed_time} seconds"
