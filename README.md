# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ----------       | ------ | ----------- |
| email            | string | null: false |
| password         | string | null: false |
| nickname         | string | null: false |
| family_name      | string | null: false |
| fast_name        | date   | null: false |
| family_name_kana | string | null: false |
| fast_name_kana   | string | null: false |
| date             | date   | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type        | Options                        |
| ----------       | ----------  | ----------------------------   |
| name             | string      | null: false                    |
| text             | text        | null: false                    |
| fee              | integer     | null: false,                   |
| user             | references  | null: false, foreign_key: true |
| category_id      | integer     | null: false                    |
| status_id        | integer     | null: false,                   |
| delivery_fee_id  | integer     | null: false,                   |
| delivery_date_id | integer     | null: false,                   |
| prefectures_id   | integer     | null: false,                   |

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false,foreign_key: true  |
| item     | references | null: false,foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column        | Type       | Options                        |
| --------      | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| number        | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |
| prefecture_id | integer    | null: false                    |

### Association

- belongs_to :purchase