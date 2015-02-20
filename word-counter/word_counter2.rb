require 'pry'

file_name = ARGV[0]
num_words = ARGV[1]

if file_name.nil? || num_words.nil?
  raise "You need to provide filename and number of words"
end

normalized_file = File.read(file_name).downcase.gsub(/\W+/, ' ')
words = normalized_file.split
stop_words = File.read("stop_words.txt").split("\n")

counted_words = {}

words.each do |word|
  next if stop_words.include?(word)
  counted_words[word] ||= 0 #Memoization
  counted_words[word] += 1
end
binding.pry
sorted_words = counted_words.sort_by { |k,v| v }.reverse
top_words = sorted_words.take(num_words.to_i)

top_words.each do |key, value|
  puts "#{key}: #{value}"
end
