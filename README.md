# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

### users table

| Column              | Type   | Options     |
| --------            | ------ | ----------- |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| nickname            | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birth_day           | date   | null: false |

### Association
- has_many :items
- has_many orders
  


items table　商品の出品(出品画像,商品名,商品の説明,商品の詳細,配送について,販売価格)
| Column               | Type       | Options     |
| --------             | ------     | ----------- |
| name           | string       | null: false |
| description     | text       | null: false |
| detail_id         | integer       | null: false |
| regarding_delivery_id| integer    | null: false |
| selling_price_id       | integer    | null: false |
| category_id             | integer    | null: false |
| prefecture_id        | integer     | null: false |
| value                | integer    | null: false |
| user               | references    | foreign_key :true |

### Association
- has_one :order
- belongs_to   :user


orders table　商品の購入
| Column    | Type       | Options     
| --------  | -----------| ----------- |
| item      | references | foreign_key :true |
| user      | references | foreign_key :true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address


addresses table　住所のテーブル
| Column         | Type     | Options     |
| --------       | ------   | ----------- |
| postal_code    | string   | null: false |
| prefecture_id    | integer   | null: false |
| municipality   | string     | null: false |
| address        | string   | null: false |
| building_name  | string     |           |
| phone_number         | string   | null: false |
| oder           | references| foreign_key :true          |
### Association

- belongs_to :order

