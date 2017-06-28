FactoryGirl.define do
    factory :comment do
        body Faker::Hipster.paragraph
        post
        user
    end
end
