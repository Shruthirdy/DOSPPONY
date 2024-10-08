#Project 1 

Team Members:
1. Yaswanth Attaluri

     UFID: 1013 6560
3. Shruthi Yaramada
   
     UFID: 2649 7222

Github Link: 

# Project description

8 sub-problems per worker request has resulted in the better performance for our code implementation.


Pony's Actor Model

One design paradigm for creating concurrent systems is the actor model. "Actors" are the basic computational units in this approach. Every actor has a local state of its own and uses message passing to interact with other actors. Because there is no shared state, there are no longer any race situations, deadlocks, or complicated thread synchronization issues that are present in other parallelism models.

The Actor Model: Why Use It?

Concurrency: By utilizing multi-core processors, the actor paradigm enables numerous actors to operate in parallel.
Message Passing: To maintain thread safety, actors converse using asynchronous messages.
Isolation: By keeping each actor in their own state, concurrent executions are executed with fewer failures and side effects.

Actors in This Project

We used two primary actor types in this project:

Boss Actor: The "boss" actor handles the overall computation by breaking the problem into smaller sub-problems (or "work units") and assigning these to worker actors.

Worker Actor: Every worker actor has a portion of sub-problems to perform, such as verifying successive numeric sequences inside a specified range. When an employee completes a task, it gives the supervisor the results.

To guarantee ideal parallelism without taxing the system with an excessive number of or insufficient number of jobs, the work units were meticulously adjusted.

Work Unit Size for Performance Tuning

It was found that eight subproblems per worker request was the ideal work unit size. In order to maximize concurrent execution while minimizing overhead, this balance was discovered by trial and error with various chunk sizes. Excessive communication overhead between the manager and employees was the outcome of too tiny work units, and ineffective parallelism use was the result of too large work units.


We have determined the optimal size by the following ways:

1. Testing the code for different work unit size:
   Code was run for varying size of work unit. For each work unit size, we divided the total number of sub-problems (_n) into chunks and assigned these chunks to workers.
   
  Work Unit Calculation: Number of Workers (work_units): It represents the number of workers that will be assigned tasks. If the total number of workers exceeds the total number of elements to process (num), the number of workers is adjusted to match num.

  Work Unit Size (chunk_size): It is the chunk of work assigned to each worker. We have calculated it by dividing the total number of elements (num) by the number of workers. 
  
  The formula used is:   var chunk_size: I64 = num / work_units.

  Remainder: We have used remainder (obtained when num is divided by work_units) handle the leftover elements that didn't fit evenly into the chunks. (This is done to ensure that all the elements are processed)

2. Comparison of performance for different size:
   By experimenting with different sizes, we concluded that window size of 600 provided the best performance in terms of execution time, resource utilization, and overall efficiency.

   For extreme cases:
   => Too many small tasks led to excessive time and resources for coordination and communication. This is creating a bottleneck situation.
   => With very less work units, some of the workers are being idle leading to slower task completion.

Output for 1000000 24:


Cores used: Efficient parallelism, utilizing approximately 8 cores
Logical CPU Cores: 8
Real Time in seconds: 0.01
User Time in seconds: 0.08
System Time in seconds: 0.00
Total CPU Time in seconds: .08
CPU Time to Real Time Ratio: 8.00


Output.txt file:

real 0.01
user 0.08
sys 0.00

