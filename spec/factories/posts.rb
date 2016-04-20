require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title   { Faker::Lorem.characters(10) }
    f.content { Faker::Lorem.paragraph }
  end
end
