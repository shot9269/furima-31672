FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.name }
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    birthday                {Faker::Date.birthday}
    first_name              {"山田"}
    last_name               {"太郎"}
    first_name_kana         {"ヤマダ"}
    last_name_kana          {"タロウ"}
    email                   {Faker::Internet.free_email}
  end
end