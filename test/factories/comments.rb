FactoryBot.define do
  factory :comment do
    sequence(:body) { |i| "sample#{i}" }
  end
end
