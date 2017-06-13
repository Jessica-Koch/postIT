require 'random_data'

50.times do
    Post.create!(
        title: Faker::Hipster.words(3),
        body: Faker::Hipster.paragraph(3, true, 1)
    )
end

posts = Post.all

100.times do
    Comment.create!(
        post: posts.sample,
        body: Faker::Hipster.paragraph(3, true, 1)
    )
end

50.times do
    Advertisement.create!(
        title: Faker::Hipster.words(3),
        body: Faker::Hipster.paragraph(3, true, 1),
        price: 13
    )
end

150.times do
    Question.create!(
        title: Faker::Hipster.words(3),
        body: Faker::Hipster.paragraph(3, true, 1),
        resolved: RandomData.random_boolean
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
