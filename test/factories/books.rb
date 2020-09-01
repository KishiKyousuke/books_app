FactoryBot.define do
  factory :book do
    sequence(:title) { |i| "title#{i}" }
    sequence(:memo) { |i| "memo#{i}" }
    sequence(:author) { |i| "author#{i}" }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, "test/fixtures/image.jpg")) }
  end
end
