#!/bin/bash

# Number of instances to start
NUM_INSTANCES=5

# Docker image name (replace 'your-image-name' with the actual image name)
IMAGE_NAME="docker.io/library/httpd:latest"

# Function to start containers
start_containers() {
    echo "Starting $NUM_INSTANCES instances of the container..."
    for ((i=1; i<=$NUM_INSTANCES; i++)); do
        podman run -d $IMAGE_NAME
    done
}

# Function to measure system resource utilization
measure_resources() {
    echo "Measuring system resource utilization..."

    # Check if there are running containers before trying to measure resources
    if [ "$(podman ps -q)" ]; then
        podman stats --no-stream $(podman ps -q)
    else
        echo "No running containers found."
    fi
}

# Function to capture application performance metrics
measure_performance() {
    echo "Capturing application performance metrics..."

    # Example 1: Using 'top' to monitor CPU and memory usage
    top -b -n 1 > top_metrics.txt

    # Example 2: Using 'ps' to list process information
    ps aux > process_info.txt

    # Example 3: Using 'curl' to measure HTTP response time
    curl -o /dev/null -s -w "Response time: %{time_total}\n" http://localhost:80

    # Add any other relevant performance metrics capturing code here
}

# Main execution
start_containers
measure_resources
measure_performance
