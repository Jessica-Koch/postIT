FactoryGirl.define do
    pw = Faker::Internet.password

    factory :user do
        name Faker::Name.name
        sequence(:email){|n| "user#{n}@factory.com"}
        password pw
        password_confirmation pw
        role :member
    end
end
