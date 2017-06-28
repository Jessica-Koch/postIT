require 'rails_helper'

RSpec.describe Comment, type: :model do
    let(:body) {Faker::Hipster.paragraph}

    let(:topic) { create(:topic) }
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let(:comment) { create(:comment) }

    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:body) }
    it {is_expected.to validate_length_of(:body).is_at_least(5)}

    describe "attributes" do
        it "responds to body" do
            expect(comment).to have_attributes(body: body)
        end
    end
    describe "after_create" do
        before do
            @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
            user.id=1
        end

    end
end
