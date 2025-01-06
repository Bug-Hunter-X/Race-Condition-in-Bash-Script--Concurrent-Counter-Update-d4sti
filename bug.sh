#!/bin/bash

# This script demonstrates a race condition bug.
# It uses two processes that try to modify a shared counter simultaneously.

counter=0

# Function to increment the counter
increment_counter() {
  local i
  for ((i=0; i<10000; i++)); do
    counter=$((counter + 1))
  done
}

# Create two processes to increment the counter
increment_counter &
increment_counter &

# Wait for the processes to finish
wait

# Print the final counter value
echo "Final counter value: $counter"