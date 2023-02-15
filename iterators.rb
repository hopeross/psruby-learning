# def conversation
#   puts "Hello"
#   yield
#   puts "Goodbye"
# end
#
# conversation { puts "Good to meet you!"}

def n_times(n)
  1.upto(n) do |i|
    yield i
  end
end

n_times(100) do |n|
  puts "\n#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
