FactoryGirl.define do
  factory :comment do |f|
    f.name    { Faker::Lorem.characters(10) }
    f.content { Faker::Lorem.sentences(2).inject(:+) }
  end
end
