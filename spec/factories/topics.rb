FactoryGirl.define do
    factory :topic do
        name Faker::Hipster.sentence
        description Faker::Hipster.paragraph
    end
end
