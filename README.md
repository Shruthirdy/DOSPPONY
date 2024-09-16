# Project description

8 sub-problems per worker request has resulted in the better performance for our code implementation.

We have determined the optimal size by the following ways:

1. Testing the code for different work unit size:
   Code was run for varying size of work unit. For each work unit size, we divided the total number of sub-problems (_n) into chunks and assigned these chunks to workers.
   
  Work Unit Calculation: Number of Workers (work_units): It represents the number of workers that will be assigned tasks. If the total number of workers exceeds the total number of elements to process (_n), the number of workers is adjusted to match _n.

  Work Unit Size (chunk_size): It is the chunk of work assigned to each worker. We have calculated it by dividing the total number of elements (_n) by the number of workers. 
  
  The formula used is:   var chunk_size: I64 = _n / work_units.

  Remainder: We have used remainder (obtained when _n is divided by work_units) handle the leftover elements that didn't fit evenly into the chunks. (This is done to ensure that all the elements are processed)

2. Comparison of performance for different size:
   By experimenting with different sizes, we concluded that 8 provided the best performance in terms of execution time, resource utilization, and overall efficiency.

   For extreme cases:
   => Too many small tasks led to excessive time and resources for coordination and communication. This is creating a bottleneck situation.
   => With very less work units, some of the workers are being idle leading to slower task completion.

Output for 1000000 26:

<img width="412" alt="Screenshot 2024-09-16 at 4 41 38 PM" src="https://github.com/user-attachments/assets/e5862c0b-4efe-4845-bf8d-13c09e0b6676">

Cores used: Parallelism effective with approx. 7 cores
Real Time: 0.01 seconds
User Time: 0.07 seconds
System Time: 0.00 seconds
CPU Time: .07 seconds
CPU Time to Real Time Ratio: 7.00
Number of Logical CPU Cores: 8


Output.txt file:

real time 0.01
user time 0.07
systime 0.00

