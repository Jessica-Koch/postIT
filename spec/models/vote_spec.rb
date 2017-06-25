require 'rails_helper'

RSpec.describe Vote, type: :model do
    let(:topic) {Topic.create!(name: Faker::Hipster.sentence(3), description: Faker::Hipster.paragraph)}
    let(:user) {User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)}
    let(:post) {topic.posts.create!(title: Faker::Hipster.sentence(3), body: Faker::Hipster.paragraph, user: user)}
    let(:vote) {Vote.create!(value: 1, post: post, user: user)}

    it { is_expected.to belong_to(:post)}
    it { is_expected.to belong_to(:user)}
    it { is_expected.to validate_presence_of(:value)}
    it {is_expected.to validate_inclusion_of(:value).in_array([-1, 1])}
end
