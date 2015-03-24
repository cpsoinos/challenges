FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
  end

  factory :question do
    sequence(:title) { |n| "This is question numero #{n}! I don't know the answer." }
    description "Aaaand this is the Question. Because, you just, you know, do the thing. And make sure that your answer is long enough! Because it was too short when I ran it last time."
    user
  end

  factory :answer do
    description "Seriously just do the thing. That's all you need. No minimum length, no maximum length, i don tknow why i'm stil typing is this long enough??? i sure hope so. "
    question
    user
  end
end
