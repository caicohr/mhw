FactoryBot.define do
    factory :user do |f|
        f.sequence(:name) { |n| "Test User #{n}" }
        f.sequence(:username) { |n| "Test Username #{n}" }
        f.sequence(:email) { |n| "test#{n}@example.com" }
        f.password { "password" }
        f.password_confirmation { |d| d.password }
    end
    factory :group do |f|
        f.sequence(:name) { |n| "Group #{n}" }
        f.sequence(:description) { |n| "Group Description #{n}" }
        f.sequence(:image_url) { |n| "imageurlhere#{n}" }
        f.association :user
    end
end