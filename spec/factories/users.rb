FactoryBot.define do
    factory :user do
        sequence(:id){|n|}
        sequence(:email){|n| "user#{n}@gmail.com"}
        sequence(:password){|n| "secret_password_#{n}"}
        sequence(:name){|n| "user_name_#{n}"}
        birth {Date.parse("10/10/2010")}
        created_at {Time.now}
        updated_at {Time.now}
        confirmed_at {Time.now}
    end
end