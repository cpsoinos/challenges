def translate(sentence)
  words = sentence.split
  words.each do |word|
    if word =~ /\A[aeiou]/
      word.insert(-1, 'way')
    else
      first_vowel = (word =~ /[aeiou]/)
      word.insert(-1, word.slice!(0..(first_vowel - 1)) + 'ay')
    end
  end
  sentence = words.join ' '
end

input = ARGV.join(" ")
puts translate(input)
