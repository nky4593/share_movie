require 'faker'

FactoryBot.define do
  factory :movie do
    movie_url { "https://www.youtube.com/watch?v=6poRfiNMRlI" }
    title { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    thumbnail_small { "https://i.ytimg.com/vi/6poRfiNMRlI/default.jpg" }
    thumbnail_medium { "https://i.ytimg.com/vi/6poRfiNMRlI/default.jpg" }
    thumbnail_large { "https://i.ytimg.com/vi/6poRfiNMRlI/default.jpg" }
    embed_url { "//www.youtube.com/embed/6poRfiNMRlI" }
    association :user
  end
end
