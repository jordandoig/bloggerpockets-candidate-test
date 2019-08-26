# frozen_string_literal: true

100.times do
  user = User.create!(name: Faker::Name.name,
                      email: Faker::Internet.email,
                      password: Faker::Internet.password(8))

  3.times do
    Post.create!(title: Faker::Lorem.sentence.gsub(/\./, ""),
                 body: Faker::Lorem.paragraph,
                 user: user,
                 published: [true, false].sample)
  end
end

Post.published.each do |post|
  2.times do
    post.comments.create body: Faker::Lorem.sentence, user: User.all.sample, published: [true, false].sample
  end
end
