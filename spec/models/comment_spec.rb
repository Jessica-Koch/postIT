require 'rails_helper'

RSpec.describe Comment, type: :model do
    let(:body) {Faker::Hipster.paragraph}

    let(:topic) {Topic.create!(name: Faker::Hipster.sentence(3), description: Faker::Hipster.paragraph)}
    let(:user) {User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)}
    let(:post) {topic.posts.create!(title: Faker::Hipster.sentence(3), body: Faker::Hipster.paragraph, user: user)}
    let(:comment) { Comment.create!(body: body, post: post, user: user) }

    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:body) }
    it {is_expected.to validate_length_of(:body).is_at_least(5)}

    describe "attributes" do
        it "responds to body" do
            expect(comment).to have_attributes(body: body)
        end
    end
end
