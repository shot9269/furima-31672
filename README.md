##Usersテーブル

| Columns                   | Types          | Option                     |
| --------------------------|----------------| ---------------------------|
| nickname                  |   string       | null: false                |
| encrypted_password        |   string       | null: false                |
| first_name                |   string       | null: false                |
| last_name                 |   string       | null: false                |
| first_name_kana           |   string       | null: false                |
| last_name_kana            |   string       | null: false                |
| birthday                  |   date         | null: false                |

###Association
- has_many :items
- has_many:order


##itemsテーブル

| Columns        | Types            | Option                            |
| ---------------|------------------| ----------------------------------|
| name           |   string         | null: false                       |
| content        |   text           | null: false                       |
| category_id    |   integer        | null: false                       |
| condition_id   |   integer        | null: false                       |
| fee_id         |   integer        | null: false                       |
| area_id        |   integer        | null: false                       |
| until_send_id  |   integer        | null: false                       |
| price          |   integer        | null: false                       |
| user           |   references     | null: false ,foreign_key: true    |
| card           |   references     | null: false ,foreign_key: true    |

###Association
- belongs_to:user
- has_one:order


##ordersテーブル

| Columns        | Types            | Option                          |
| ---------------|------------------| --------------------------------|
| user_id        |   references     | null: false,foreign_key: true   |
| item_id        |   references     | null: false,foreign_key: true   |

###Association
- belongs_to:user
- belongs_to:item
- has_one:addresses


##addressesテーブル

| Columns        | Types            | Option                            |
| ---------------|------------------| ----------------------------------|
| postal_code    |   string         | null: false                       |
| prefecture_id  |   integer        | null: false                       |
| city           |   string         | null: false                       |
| area           |   string         | null: false                       |
| building       |   string         |                                   |
| phone_number   |   string         | null: false                       |

###Association
- belongs_to:item


