#Project 1 

Team Members:
1. Yaswanth Attaluri
     UFID: 1013 6560
2. Shruthi Yaramada
     UFID:
   
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

Output for 1000000 24:


Cores used: Parallelism effective with approx. 8 cores
Real Time: 0.01 seconds
User Time: 0.08 seconds
System Time: 0.00 seconds
CPU Time: .08 seconds
CPU Time to Real Time Ratio: 8.00
Number of Logical CPU Cores: 8


Output.txt file:

real time 0.01
user time 0.08
systime 0.00

