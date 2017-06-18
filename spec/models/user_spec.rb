require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new(name: "Jessica Koch", email: "user@postit.com", password: "password") }

    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_length_of(:name).is_at_least(1)}
    it {is_expected.to allow_value("Jessica Koch").for(:name)}

    # Shoulda tests for email
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_uniqueness_of(:email)}
    it {is_expected.to validate_length_of(:email).is_at_least(3)}
    it {is_expected.to allow_value("user@postit.com").for(:email)}

    # Shoulda tests for password
    it {is_expected.to validate_presence_of(:password)}
    it {is_expected.to have_secure_password}
    it {is_expected.to validate_length_of(:password).is_at_least(6)}

    describe "attributes" do
        it "should have name and email attributes" do
            user.name = 'Jessica Koch'
            expect(user).to have_attributes(name: "Jessica Koch", email: "user@postit.com")
        end

        it "should capitalize the user's name" do
            expect(user.name).to include "Jessica Koch"
        end
    end

    describe "invalid user" do
        let(:user_with_invalid_name) {User.new(name: "", email: "user@postit.com")}
        let(:user_with_invalid_email) {User.new(name: "postIt user", email: "")}

        it "should be an invalid user due to blank name" do
            expect(user_with_invalid_name).to_not be_valid
        end

        it "should be an invalid user due to blank email" do
            expect(user_with_invalid_email).to_not be_valid
        end
    end
end