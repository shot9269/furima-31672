Usersテーブル

| Columns                   | Types          | Option                     |
| --------------------------|----------------| ---------------------------|
| nickname                  |   string       | null: false                |
| email                     |   string       | null: false, unique: true  |
| password                  |   string       | null: false                |
| password_confirmation     |   string       | null: false                |
| first_name                |   string       | null: false                |
| last_name                 |   string       | null: false                |
| first_name_kana           |   string       | null: false                |
| last_name_kana            |   string       | null: false                |
| birth_year                |   integer      | null: false                |
| birth_month               |   integer      | null: false                |
| birth_day                 |   integer      | null: false                |

Association
has_many :items
has_one:cards


itemsテーブル

| Columns        | Types            | Option                            |
| ---------------|------------------| ----------------------------------|
| image          |   activeStorage  | null: false                       |
| name           |   string         | null: false                       |
| content        |   text           | null: false                       |
| category       |   activeHash     | null: false                       |
| condition      |   activeHash     | null: false                       |
| fee            |   activeHash     | null: false                       |
| area           |   activeHash     | null: false                       |
| until_send     |   activeHash     | null: false                       |
| price          |   integer        | null: false                       |
| user_id        |   references     | null: false ,foreign_key: true    |

Association
belongs_to:user
has_one:cards


cardsテーブル

| Columns        | Types            | Option                          |
| ---------------|------------------| --------------------------------|
| number         |   integer        | null: false,unique: true        |
| expire_month   |   integer        | null: false                     |
| expire_day     |   integer        | null: false                     |
| sequlity_code  |   integer        | null: false                     |
| user_id        |   references     | null: false,foreign_key: true   |
| item_id        |   references     | null: false,foreign_key: true   |

Association
belongs_to:user
belongs_to:item
has_one:addresses


addressesテーブル

| Columns        | Types            | Option                            |
| ---------------|------------------| ----------------------------------|
| postal_code    |   integer        | null: false                       |
| prefecture     |   string         | null: false                       |
| city           |   string         | null: false                       |
| area           |   string         | null: false                       |
| building       |   string         |                                   |
| phone_number   |   integer        | null: false                       |
| card_id        |   references     | null: false, foreign_key: true    |

Association
belongs_to:cards


