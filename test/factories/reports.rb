FactoryBot.define do
  factory :report do
    sequence(:title) { |i| "title#{i}" }
    date { "2020-01-01" }
    study_time { 1 }
    body { "sample" }
  end
end
