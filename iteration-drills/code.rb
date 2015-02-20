#Write Ruby<->English answers here as comments in your code
### Turning `.each` into English
# 1. For every number in the array 'numbers', print out three times the number.
# 2. For every name in the array 'names', print out the length of the name.
# 3. Initiate a new variable 'sum', and set its value to 0. Then, for each
#    number in the array 'numbers', increment 'sum' by that number.
# 4. For each key-value pair in the hash 'hash', print out the pair in the form
#    of 'key' is 'value' years old.
# 5. Initiate a new variable 'sum', and set its value to 0. Then, for each value
#    in the key-value pair of the hash 'accounts', increment sum by that value.
# 6. For every key-value pair in the hash 'addresses', print them out in the
#    form of 'key' lives on 'value'.

### Turning English into `.each`
# 1.
    sentences.each do |word|
      puts 'word'
    end
# 2.
    ma_area_codes = ['339', '351', '413', '508', '617', '774', '781', '857', '978']
    numbers.each do |phone_number|
      ma_area_codes.each do |area_code|
        if phone_number.start_with?(area_code)
          puts phone_number
        end
      end
    end
# 3.
    numbers.each do |number|
      puts number unless number % 2 == 0
    end
# 4.
    ages.each do |name, age|
      puts "#{name} is #{age} years old."
    end
# 5.
    ages.each do |name, age|
      if age > 10
        puts "#{name} is #{age} years old."
      end
    end
# 6.
    ages.each do |name, age|
      if age % 2 == 0
        puts "#{name} is #{age} years old."
      end
    end


array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# Write Ruby code to find out the answers to the following questions:

# * What is the sum of all the numbers in `array`?
sum = 0
array.each do |number|
  sum += number
end
puts sum
# * How would you print out each value of the array?
puts array
# * What is the sum of all of the even numbers?
sum_even_numbers = 0
array.each do |number|
  if number.even?
    sum_even_numbers += number
  end
end
puts sum_even_numbers
# * What is the sum of all of the odd numbers?
sum_odd_numbers = 0
array.each do |number|
  if number.odd?
    sum_odd_numbers += number
  end
end
puts sum_odd_numbers
# * What is the sum of all the numbers divisble by 5?
sum_divisible_by_five = 0
array.each do |number|
  if number % 5 == 0
    sum_divisible_by_five += number
  end
end
puts sum_divisible_by_five
# * What is the sum of the squares of all the numbers in the array?
sum_squares = 0
array.each do |number|
  sum_squares += (number * number)
end
puts sum_squares

array = ["joanie","annamarie","muriel","drew","reva","belle","amari","aida","kaylie","monserrate","jovan","elian","stuart","maximo","dennis","zakary","louvenia","lew","crawford","caitlyn"]

# Write Ruby code to find out the answers to the following questions:

# * How would you print out each name backwards in `array`?
array.each do |name|
  puts name.reverse
end
# * What are the total number of characters in the names in `array`?
total_characters = 0
array.each do |name|
  total_characters += name.length
end
puts total_characters
# * How many names in `array` are less than 5 characters long?
names_less_than_five_characters = 0
array.each do |name|
  if name.length < 5
    names_less_than_five_characters += 1
  end
end
puts names_less_than_five_characters
# * How many names in `array` end in a vowel?
names_ending_in_vowel = 0
array.each do |name|
  if name =~ /[aeiou]\z/
    names_ending_in_vowel += 1
  end
end
puts names_ending_in_vowel
# * How many names in `array` are more than 5 characters long?
names_more_than_five_characters = 0
array.each do |name|
  if name.length > 5
    names_more_than_five_characters =+ 1
  end
end
puts names_more_than_five_characters
# * How many names in `array` are exactly 5 characters in length?
names_exactly_five_characters = 0
array.each do |name|
  if name.length == 0
    names_exactly_five_characters += 1
  end
end
puts names_exactly_five_characters

best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

#  Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of the artists?
best_records.each do |key, value|
  puts key
end
# * How would you print out all the names of the albums?
best_records.each do |key, value|
  puts value
end
# * Which artist has the longest name?
best_records_length = {}
best_records.each do |key, value|
  best_records_length[key] = key.length
end
puts best_records_length.keys.max
# * How would you change all the album titles for every artist to `Greatest Hits`?
best_records.each do |key, value|
  best_records[key] = 'Greatest Hits'
end
puts best_records
# * How would you delete a key-value pair if the artist's name ends in a vowel?
best_records.delete_if {|key, value| key =~ /[aeiou]\z/}
puts best_records

ages = {"Arch"=>89, "Gretchen"=>93, "Simone"=>12, "Daija"=>96, "Alivia"=>22, "Serena"=>28, "Alek"=>3, "Lula"=>24, "Christian"=>62, "Darryl"=>47, "Otha"=>32, "Evalyn"=>44, "Lincoln"=>27, "Rebeca"=>99, "Beatrice"=>99, "Kelton"=>10, "Zachary"=>18, "Aurelie"=>91, "Dell"=>71, "Lisandro"=>22}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `ages`?
ages.each do |name, age|
  puts name
end
# * How would you print out each key-value pair in the format of `<name> is <age> years old.`?
ages.each do |name, age|
  puts "#{name} is #{age} years old."
end
# * How would you print out every person with odd numbered age?
ages.each do |name, age|
  puts name if age.odd?
end
# * How would you delete everyone under 25 years of age?
ages.each do |name, age|
  ages.delete(name) if age < 25
end
puts ages
# * What is the name and age of everyone with a name greater than or equal to 5 characters?
ages.each do |name, age|
  if name.length > 5
    puts "#{name} is #{age} years old."
  end
end

people =
{
  "Alia O'Conner PhD" => {
         "phone" => "538.741.1841",
       "company" => "Leuschke-Stiedemann",
      "children" => [
          "Simone",
          "Cindy",
          "Jess"
      ]
  },
           "Ike Haag" => {
         "phone" => "(661) 663-8352",
       "company" => "Carter Inc",
      "children" => [
          "Joe",
          "Ofelia",
          "Deron"
      ]
  },
       "Brian Heller" => {
         "phone" => "1-288-601-5886",
       "company" => "O'Conner Group",
      "children" => [
          "Renee"
      ]
  },
       "Maryse Johns" => {
         "phone" => "218-571-8774",
       "company" => "Kuhlman Group",
      "children" => [
          "Dominick",
          "Tricia"
      ]
  },
  "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
      "company" => "Heidenreich, Nietzsche and Dickinson"
  }
}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `people`?
puts people.keys
# * How would you print out all the names of `people` and which company they work for?
name_and_company = {}
people.each do |name, hash|
  name_and_company[name] = hash["company"]
end
puts name_and_company
# * What are the names of all the children of everyone in `people`?
people.each do |name, hash|
  puts hash["children"]
end
# * What are the names of all the companies that people work for?
people.each do |name, hash|
  puts hash["company"]
end
# * How would you convert all the phone numbers to the same standard (pick one)?
people.each do |name, hash|
  hash["phone"].gsub!(/[.(\-) ]/, '')
  phone_number = hash["phone"]
  phone_number.sub!(%r{^1},"") if phone_number.length >= 10
  puts phone_number
end


people =
[
    {
          "Derek Wehner" => {
               "phone" => "588-047-7782",
             "company" => "Daniel-Carroll",
            "children" => [
                "Phoebe",
                "Gretchen",
                "Wiley"
            ]
        },
           "Ali Koelpin" => {
               "phone" => "1-127-057-0020",
             "company" => "Rau, Rutherford and Lockman",
            "children" => [
                "Juwan"
            ]
        },
        "Ervin Prohaska" => {
               "phone" => "(393) 630-3354",
             "company" => "Carter Inc",
            "children" => [
                "Virgil",
                "Piper",
                "Josianne"
            ]
        },
          "Hellen Borer" => {
              "phone" => "1-687-825-0947",
            "company" => "Maggio, Ferry and Moen"
        }
    },
    {
        "Elinor Johnson" => {
              "phone" => "819.911.5553",
            "company" => "Pollich Group"
        }
    },
    {
        "Richmond Murray" => {
               "phone" => "1-516-432-2364",
             "company" => "Sporer and Sons",
            "children" => [
                "Kade",
                "Sage"
            ]
        },
            "Nakia Ferry" => {
               "phone" => "134-079-2237",
             "company" => "Hamill, O'Keefe and Lehner",
            "children" => [
                "Rollin"
            ]
        }
    }
]

# Write Ruby code to find out the answers to the following questions:

# * What are the names of everyone in `people`?
people.each do |person|
  puts person.keys
end
# * What are the names of all the children in `people`?
people.each do |person|
  person.each do |name, info| #info is a hash
    if info.has_key?("children")
      puts info["children"]
    end
  end
end
# * How would you create a new hash called `phone_numbers` that has a key of a name and value of a phone number in `people`?
phone_numbers = {}
people.each do |person|
  person.each do |name, info|
    phone_numbers[name] = info["phone"]
  end
end
puts phone_numbers
# * How would you create a new hash called `employers` that has a key of a name and a value of a company name in `people`?
employers = {}
people.each do |person|
  person.each do |name, info|
    employers[name] = info["company"]
  end
end
puts employers
# * How would you create a new hash called `children_count` that has a key of a name and a value of the number of children a person has?
children_count = {}
people.each do |person|
  person.each do |name, info|
    if info.has_key?("children")
      children_count[name] = info["children"].count
    end
  end
end
puts children_count
