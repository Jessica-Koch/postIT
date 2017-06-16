require 'rails_helper'

RSpec.describe Comment, type: :model do
    let(:topic) {Topic.create!(name: Faker::Hipster.sentence(3), description: Faker::Hipster.paragraph)}
    let(:post) {topic.posts.create!(title: Faker::Hipster.sentence(3), body: Faker::Hipster.paragraph)}
    let(:post) { Faker::Hipster.sentence(3)}
    let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

    describe "attributes" do
    end
end
