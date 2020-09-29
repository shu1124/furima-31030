# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| date       | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ----------    | ---------- | ----------------------------   |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false,                   |
| item-fee      | integer    | null: false,                   |
| delivery-fee  | integer    | null: false,                   |
| delivery-date | integer    | null: false,                   |
| prefectures   | string     | null: false,                   |
| user_id       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false,foreign_key: true  |
| item_id  | references | null: false,foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column      | Type       | Options                        |
| --------    | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| number      | string     | null: false                    |
| building    | string     |                                |
| phone_number| integer    | null: false                    |
| purchase_id | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase