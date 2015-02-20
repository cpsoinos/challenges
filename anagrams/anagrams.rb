words = {}

File.open("wordlist.txt", "r") do |f|
  f.each do |line|
    word = line.chomp.to_s
    words[word] = word.split(//).sort
  end
end

words.each do |word, sorted_letters|
  words.invert
end
puts words


# words.each do |word, sorted_letters|
#   if sorted_letters.unique?
#     delete words[sorted_letters]
#   end
# end

# anagram_count = 0
#
# words.each do |word, sorted_letters|
#   if
#
#   # # if words.values.include?(sorted_letters)
#   # if words.has_value?(sorted_letters)
#   #   puts word + ' ' + words.has_value?(sorted_letters).to_s
#   # end
# end

# words.each do |word, letters|
#   anagram = {}
#   # letters.sort.join("") sorts letters in each word
#   anagram[word] = words.keys.include?(letters.sort.join(""))
#
#   anagram.each do |word_again, sorted_letters|
#
#   end
#
#
#   if anagram[word] == true
#     puts word +
#   puts anagram
# end
