require 'pry'


file_name = ARGV[0]
action = ARGV[1]

normalized_file = File.read(file_name).gsub(/\W+/, ' ')
characters = normalized_file.chars
weight = {}

characters.each do |character|
  weight[character] = characters.count(character)
end

# words.each do |word|
#   characters << word.chars
# end
binding.pry
puts weight

# def compress(file)
#   @content = file.split("\n\n")
#   @paragraphs = []
#   @letters = []
#
#   @content.each do |p|
#     @paragraphs << (p.split)
#   end
#   @paragraphs.each do |word|
#     @letters << (word.split)
#   end
#   @letters
#   binding.pry
# end

# content = compress(file)    # array of paragraphs, each of which is an array of the words in the paragraph
# stored_words = {}           # hash of stored words and number of times they occur

content.each do |paragraph| # paragraph is an array of paragraphs in content
  paragraph.each do |word|  # word is an array of words in each paragraph
    stored_words[word.gsub!(/\W+/, '')] = paragraph.count(word.gsub!(/\W+/, ''))
  end
end

stored_words.delete_if { |key, value| value == 1}

words_to_compress = []
stored_words.keys.each do |word|
  words_to_compress << word
end
binding.pry



compress(file)
