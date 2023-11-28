# Record the start time
start_time=$(date +%s.%N)

# Send a request to the container
curl -s http://localhost:8088/

# Record the end time
end_time=$(date +%s.%N)

# Calculate the elapsed time
elapsed_time=$(echo "$end_time - $start_time" | bc)

# Print the elapsed time
echo "Response time: ${elapsed_time} seconds"
