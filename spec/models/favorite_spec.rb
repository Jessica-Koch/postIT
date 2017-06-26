require 'rails_helper'

RSpec.describe Favorite, type: :model do
    let(:topic) {Topic.create!(name: Faker::Hipster.sentence(3), description: Faker::Hipster.paragraph)}
    let(:user) {User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)}
    let(:post) {topic.posts.create!(title: Faker::Hipster.sentence(3), body: Faker::Hipster.paragraph, user: user)}
    let(:favorite) {Favorite.create!(post: post, user: user)}
end
