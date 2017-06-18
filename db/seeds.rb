require 'random_data'

15.times do
    Topic.create!(
        name: Faker::Hipster.sentence(2),
        description: Faker::Hipster.paragraph(3)
    )
end
topics = Topic.all

50.times do
    Post.create!(
        topic:  topics.sample,
        title: Faker::Hipster.sentence(2),
        body: Faker::Hipster.paragraph(3, true, 1)
    )
end
posts = Post.all

10.times do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password_digest: Faker::Internet.password(8)
    )
end
users = User.all

25.times do
    SponsoredPost.create!(
        topic: topics.sample,
        title: Faker::Hipster.sentence(2),
        body: Faker::Hipster.paragraph(1),
        price: Faker::Commerce.price
    )
end
sponsored_posts = SponsoredPost.all


100.times do
    Comment.create!(
        post: posts.sample,
        body: Faker::Hipster.paragraph(3, true, 1)
    )
end

150.times do
    Question.create!(
        title: Faker::Hipster.sentence(2),
        body: Faker::Hipster.paragraph(3, true, 1),
        resolved: RandomData.random_boolean
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Topic.count} topics created"
puts "#{User.count} users created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Question.count} questions created"
