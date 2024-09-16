use "collections"
use "time"

actor Main
  new create(env: Env) =>
    try
      let args = env.args
      let n = args(1)?.i64()?
      let k = args(2)?.i64()?
      
      let boss = Boss(n, k, env)
      env.out.print(n.string()) 
      env.out.print(k.string())
      boss.distribute_tasks()
    else
      env.out.print("Value of n and k has to be given in arguments") 
    end

actor Boss
  let _n: I64
  let _k: I64
  let _env: Env

  new create(n: I64, k: I64, env: Env) =>
    _n = n
    _k = k
    _env = env

  be distribute_tasks() =>
    _env.out.print("Inside distribute task in Boss actor")
    _env.out.print("_n: " + _n.string())

    // Number of workers is chosen to be 8 to optimize performance
    var work_units: I64 = 8
    _env.out.print("Quantity of workers to perform the task: " + work_units.string())
    if _n < 8 then
      work_units = _n
    end

    // Total amount of work is to be divided equally among all the work units available
    var chunk_size: I64 = _n / work_units
    _env.out.print("Work chunk assigned to each: " + chunk_size.string())


    let remainder: I64 = _n % work_units
    var task_intervals: Array[(I64, I64)] = []

    var beg_index: I64 = 1

    // Check if either n or work_units is odd
    if (((_n % 2) != 0) or ((work_units % 2) != 0)) and (remainder != 0) then
      // Apply sliding window by adjusting the last chunk
      for i in Range[I64](0, work_units - 1) do
        let end_index: I64 = (i + 1) * chunk_size
        task_intervals.push((beg_index, end_index))
        beg_index = end_index + 1
      end
      // Adjust last range to include all remaining elements
      task_intervals.push((beg_index, _n))
    else
      // Evenly distribute if both are even
      for i in Range[I64](0, work_units) do
        let end_index: I64 = (i + 1) * chunk_size
        task_intervals.push((beg_index, end_index))
        beg_index = end_index + 1
      end
    end

    for i in task_intervals.values() do
      let worker = Worker(this, _env)
      worker.perform_task(i._1, i._2, _k)
    end

actor Worker
  let _boss: Boss
  let _env: Env

  new create(boss: Boss, env: Env) =>
    _boss = boss
    _env = env

  // This method will check for the number of sequences possible with given condition 
  be perform_task(beg_index: I64, end_index: I64, k: I64) =>
    // Iterating over each possible beg_indexing point (from 1 to n in this case)
    for i in Range[I64](beg_index, end_index + 1) do
      if is_perfect_square_sum(i, k) then
        let end_of_sequence = (i + k) - 1
        _env.out.print(i.string() + " to " + end_of_sequence.string() + " is a sequence")
      end
    end

// Function to check if sum of squares of k consecutive numbers beg_indexing with "beg_index" is a perfect square
fun is_perfect_square_sum(beg_index: I64, k: I64): Bool =>
  let stop: I64 = beg_index + (k - 1)
  let sum = sum_of_squares(stop) - sum_of_squares(beg_index - 1)
  let root = square_root_func(sum)
  (root * root) == sum

// Function to calculate the sum of squares from 1 to n
fun sum_of_squares(num: I64): I64 =>
  (num * (num + 1) * ((2 * num) + 1)) / 6

fun square_root_func(number: I64): I64 =>
  // For number = 0 and number = 1, square root returns the number itself
  if number < 2 then
    number  
  else
    var result: I64 = 0
    // beg_index with the highest bit position that could be part of the result.
    var bit: I64 = 1 << 62  
    // Use a temporary variable to hold the value of n.
    var temp_n: I64 = number  

    while bit > temp_n do
      // Shift right by 2 bits to reduce the bit position.
      bit = bit >> 2  
    end

    while bit != 0 do
      if temp_n >= (result + bit) then
        temp_n = temp_n - (result + bit)
        result = result + (bit << 1)
      end
      result = result >> 1
      bit = bit >> 2
    end

    result
  end
