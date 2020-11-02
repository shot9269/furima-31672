FactoryBot.define do
  factory :item do
    name                { Faker::Name.name }
    content             { Faker::Lorem.sentence }
    price               { 10000 }
    user_id             { user.id = 1 }
    category_id         { 2 }
    condition_id        { 2 }
    fee_id              { 2 }
    area_id             { 2 }
    send_id             { 2 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
    association :user
  end
end
