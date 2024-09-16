#!/bin/bash

# Ensure at least two arguments are provided: the file path and some arguments
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <executable> <arg1> <arg2> ... <argN>"
  exit 1
fi

# Extract the executable path and the arguments
filePath="$1"
shift # Shift arguments so $@ now contains only the arguments for the executable

# Check if the file exists
if [ ! -f "$filePath" ]; then
  echo "Executable file not found: $filePath"
  exit 1
fi

# Measure real time, user time, and system time using BSD time (macOS version)
/usr/bin/time -p "$filePath" "$@" 2> time_output.txt

# Extract the timing information from the file
real_time=$(grep 'real' time_output.txt | awk '{print $2}')
user_time=$(grep 'user' time_output.txt | awk '{print $2}')
sys_time=$(grep 'sys' time_output.txt | awk '{print $2}')

# Calculate CPU time as the sum of user time and system time
cpu_time=$(echo "$user_time + $sys_time" | bc)

# Handle small input cases: If real time is too small, don't calculate ratio
if (( $(echo "$real_time < 0.01" | bc -l) )); then
  echo "Real Time too small to measure. Cores used: N/A"
  exit 0
fi

# Calculate the ratio of CPU time to real time
cpu_real_ratio=$(echo "scale=2; $cpu_time / $real_time" | bc)

# Get the number of logical CPU cores
if [[ "$OSTYPE" == "darwin"* ]]; then
    num_cores=$(sysctl -n hw.logicalcpu)  # macOS
else
    num_cores=$(nproc --all)  # Linux
fi

# Display feedback based on the ratio and calculate cores used
if (( $(echo "$cpu_real_ratio < 1.01" | bc -l) )); then
  echo "Cores used: Very low parallelism (CPU time close to Real time)"
elif (( $(echo "$cpu_real_ratio > $num_cores" | bc -l) )); then
  echo "Cores used: More than available cores! Something is off."
else
  echo "Cores used: Parallelism effective with approx. $(echo $cpu_real_ratio | awk '{printf "%d", $1}') cores"
fi

# Display the results
echo "Real Time: $real_time seconds"
echo "User Time: $user_time seconds"
echo "System Time: $sys_time seconds"
echo "CPU Time: $cpu_time seconds"
echo "CPU Time to Real Time Ratio: $cpu_real_ratio"
echo "Number of Logical CPU Cores: $num_cores"