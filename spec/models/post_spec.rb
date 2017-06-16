require 'rails_helper'

RSpec.describe Post, type: :model do
    let(:name) {Faker::Hipster.sentence(3)}
    let(:description) {Faker::Hipster.paragraph}
    let(:title) {Faker::Hipster.sentence(3)}
    let(:body) {Faker::Hipster.paragraph}

    let(:topic) {Topic.create!(name: name, description: description)}
    let(:post) {topic.posts.create!(title: title, body: body)}

    it { is_expected.to belong_to(:topic) }

    describe "attributes" do
        it "has a title and body attributes" do
            expect(post).to have_attributes(title: title, body: body)
        end
    end
end
