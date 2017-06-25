require 'rails_helper'

RSpec.describe Post, type: :model do
    let(:name) {Faker::Hipster.sentence(3)}
    let(:description) {Faker::Hipster.paragraph}
    let(:title) {Faker::Hipster.sentence(3)}
    let(:body) {Faker::Hipster.paragraph}

    let(:topic) {Topic.create!(name: name, description: description)}
    let(:user) {User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)}
    let(:post) {topic.posts.create!(title: title, body: body, user: user)}

    it { is_expected.to have_many(:comments)}
    it { is_expected.to have_many(:votes)}
    it { is_expected.to belong_to(:topic) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:topic) }
    it { is_expected.to validate_presence_of(:user) }

    it {is_expected.to validate_length_of(:title).is_at_least(5)}
    it { is_expected.to validate_length_of(:body).is_at_least(20) }
    describe "attributes" do
        it "has a title, body and user attributes" do
            expect(post).to have_attributes(title: title, body: body, user: user)
        end
    end
    describe "voting" do

        before do
            3.times { post.votes.create!(value: 1) }
            2.times { post.votes.create!(value: -1) }
            @up_votes = post.votes.where(value: 1).count
            @down_votes = post.votes.where(value: -1).count
        end

        describe "#up_votes" do
            it "counts the number of votes with value = 1" do
                expect( post.up_votes ).to eq(@up_votes)
            end
        end


        describe "#down_votes" do
            it "counts the number of votes with value = -1" do
                expect( post.down_votes ).to eq(@down_votes)
            end
        end

        describe "#points" do
            it "returns the sum of all down and up votes" do
                expect( post.points ).to eq(@up_votes - @down_votes)
            end
        end
    end
end
