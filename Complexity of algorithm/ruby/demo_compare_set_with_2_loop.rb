# frozen_string_literal: true

# Object: Given an array of integer with integer s
# Finding in the array have couple of number equal with s
# example
# arr = [0, 4, 7, -2, 6, 9, 10]
# s = 9 --> true ( 0 + 9 )
# s = 3 --> false
class Worker
  attr_reader :num_of_arr, :arr, :sum

  def initialize(args = {})
    defaults = { num_of_arr: 10, sum: 20 }
    args = defaults.merge(args)
    @num_of_arr = args[:num_of_arr]
    @sum = args[:sum]
    init_array
  end

  def set_rand_sum
    @sum = rand(-999_999_999..999_999_999)
  end

  def num_of_arr=(number)
    @num_of_arr = number
    init_array
  end

  def find_basic
    i = 0
    while i < @arr.size - 1
      j = i + 1
      while j < @arr.size
        return true if @arr[i] + @arr[j] == @sum
        j += 1
      end
      i += 1
    end
    false
  end

  def find_set
    require 'set'
    set = Set.new
    @arr.each do |element|
      return true if set.include?(@sum - element)
      set.add(element)
    end
    false
  end

  def show_details
    puts "Array have: #{@num_of_arr} element(s), SUM: #{@sum}"
    # puts "#{@arr}"
  end

  private

  def init_array
    @arr = Array.new(@num_of_arr) { rand(-999_999_999..999_999_999) }
  end
end

test = Worker.new

require 'benchmark'

test.num_of_arr = 100
test.set_rand_sum
test.show_details
Benchmark.bm(20) do |benchmark|
  benchmark.report('find_basic: ') { test.find_basic }
  benchmark.report('find_set: ') { test.find_set }
end
p "The result of this test case is: #{test.find_set}"
puts "-----------------------------------------------------------------\n"

test.num_of_arr = 1_000
test.set_rand_sum
test.show_details
Benchmark.bm(20) do |benchmark|
  benchmark.report('find_basic: ') { test.find_basic }
  benchmark.report('find_set: ') { test.find_set }
end
p "The result of this test case is: #{test.find_set}"
puts "-----------------------------------------------------------------\n"

test.num_of_arr = 10_000
test.set_rand_sum
test.show_details
Benchmark.bm(20) do |benchmark|
  benchmark.report('find_basic: ') { test.find_basic }
  benchmark.report('find_set: ') { test.find_set }
end
p "The result of this test case is: #{test.find_set}"
puts "-----------------------------------------------------------------\n"

test.num_of_arr = 100_000
test.set_rand_sum
test.show_details
Benchmark.bm(20) do |benchmark|
  benchmark.report('find_basic: ') { test.find_basic }
  benchmark.report('find_set: ') { test.find_set }
end
p "The result of this test case is: #{test.find_set}"
puts "-----------------------------------------------------------------\n"

test.num_of_arr = 1_000_000
test.set_rand_sum
test.show_details
Benchmark.bm(20) do |benchmark|
  benchmark.report('find_basic: ') { test.find_basic }
  benchmark.report('find_set: ') { test.find_set }
end
p "The result of this test case is: #{test.find_set}"
puts "-----------------------------------------------------------------\n"
