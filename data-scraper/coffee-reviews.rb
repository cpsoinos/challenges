#!/usr/bin/env ruby

# YOUR CODE HERE - GET SCRAPING
require 'pry'
require 'net/http'
require 'nokogiri'
require 'open-uri'

url = "http://www.amazon.com/Mr-Coffee-BVMC-SJX33GT-Programmable-Coffeemaker/product-reviews/B0047Y0UQO/ref=cm_cr_dp_see_all_btm?ie=UTF8&showViewpoints=1&sortBy=bySubmissionDateDescending"

data = Nokogiri::HTML(open(url))

class Review
  def initialize(review)
    @review = review
  end

  def get_rating
    @review.at_css('.swSprite').text
  end

  def get_review_text
    @review.at_css('.reviewText').children.text
  end

end

list_of_reviews = []
scraped_reviews = data.css('#productReviews').to_a
scraped_reviews.each do |scrape|
  list_of_reviews << Review.new(scrape)
  # binding.pry
end

# product_reviews = Review.new(scraped_reviews)
# binding.pry
review_and_rating = {}

list_of_reviews.each do |review|
  review_and_rating[review.get_rating] = review.get_review_text
end

# product_reviews.each do |review|
#   review_and_rating[review.get_rating] = review.get_review_text
# end
# binding.pry
puts review_and_rating


  # review_and_rating[review.css('.swSprite')] = product_reviews.css('.reviewText')
# end

# puts product_reviews.css('.swSprite').each do #gets me # of stars
# # binding.pry
# # puts product_reviews
# # puts reviews.length
#
# reviews = {}
#
# product_reviews.each do
# end
#
# collected_reviews = []
#
# reviews.each do |review|
#
#   collected_reviews << review.children.text
#   binding.pry
# end
# #
# # binding.pry
# # puts collected_reviews
#
# def is_positive?
#   #return true if review is positive
# end
#
# words = {}
# collected_reviews.each do |review|
#   words_per_review = review.split
#   words_per_review.each do |word|
#     words[word] = words_per_review.count(word)
#   end
# end
#
# sorted = words.sort_by { |_word, frequency| frequency }
# sorted.reverse!
#
# binding.pry
# puts sorted
