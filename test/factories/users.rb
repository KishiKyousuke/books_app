FactoryBot.define do
  factory :user, class: User, aliases: [:following, :follower] do
    name { "Tarou Yamada" }
    sequence(:uid) { |i| i }
    sequence(:email) { |i| "user#{i}@example.com" }
    password { "1234567890" }

    trait :with_github do
      provider { "github" }
    end
  end
end
