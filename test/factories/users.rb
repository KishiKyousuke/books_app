FactoryBot.define do
  factory :user1, class: User do
    id { 1 }
    provider { "github" }
    name { "Tarou Yamada" }
    uid { "12345678" }
    email { "tarou@example.com" }
    password { "1234567890" }
  end

  factory :user2, class: User, aliases: [:following] do
    id { 2 }
    uid { "2" }
    name { "Masami Iwaki" }
    email { "masami@example.com" }
    password { "123456" }
  end

  factory :user3, class: User, aliases: [:follower] do
    id { 3 }
    uid { "3" }
    name { "Satoru Satonaka" }
    email { "satoru@example.com" }
    password { "123456" }
  end

  factory :user4, class: User do
    id { 4 }
    uid { "4" }
    name { "Kazuto Tonoma" }
    email { "kazuto@example.com" }
    password { "123456" }
  end
end
