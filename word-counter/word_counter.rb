input =  ARGV.join(" ")

def word_counter(input)
  input_array = input.split " "

  words = []
  words_counted = {}
  filename = input_array[0]
  number_to_count = input_array[1].to_i

  file = File.open("#{filename}", "rb")
  content = file.read
  words = content.downcase.gsub(/\W+/, ' ').split ' '

  words.each do |word|
    words_counted[word] = words.count(word)
  end

  stop_words = []
  File.open("stop_words.txt").readlines.each do |line|
    stop_words << line.chomp
  end

  stop_words.each do |stop_word|
    if words_counted[stop_word] = true
      words_counted.delete(stop_word)
    end
  end

  sorted = words_counted.sort_by { |_word, frequency| frequency }
  sorted.reverse!

  most_frequent = sorted[0..number_to_count]

  most_frequent.each do |pair|
    puts "#{pair[0]}: #{pair[1]}"
  end
end

word_counter(input)
