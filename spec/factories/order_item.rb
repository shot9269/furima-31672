FactoryBot.define do
  factory :order_item do
    postal_code     { "123-4567"}
    prefecture_id     {4}
    city              { "名古屋市" }
    area              { "名古屋町" }
    building          { "名古屋ビル" }
    phone_number      { 19011111111 }
    item_id           { 3 }
    user_id           { 5 }
    token             { "pk_test_*********************" }
  end
end