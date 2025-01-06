#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

counter=0
lock_file="counter.lock"

# Function to increment the counter using a lock file
increment_counter() {
  local i
  for ((i=0; i<10000; i++)); do
    # Acquire the lock
    flock "$lock_file" 
    # Increment the counter
    counter=$((counter + 1))
    # Release the lock
    flock -u "$lock_file"
  done
}

# Create two processes to increment the counter
increment_counter &
increment_counter &

# Wait for the processes to finish
wait

# Print the final counter value
echo "Final counter value: $counter"

# Remove the lock file (optional)
rm -f "$lock_file"