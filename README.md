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
| name                | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birth_day           | date   | null: false |

### Association
- has many :items
- has many orders
  


items table　商品の出品(出品画像,商品名,商品の説明,商品の詳細,配送について,販売価格)
| Column               | Type       | Options     |
| --------             | ------     | ----------- |
| address_id           | integer    | null: false |
| item_names           | text       | null: false |
| item_description     | text       | null: false |
| item_details         | text       | null: false |
| regarding_delivery_id| integer    | null: false |
| selling_prices       | integer    | null: false |
| category             | integer    | null: false |

### Association
- has_one :order
- has many   :user


orders table　商品の購入
| Column    | Type       | Options     
| --------  | -----------| ----------- |
| item_id   | references |             |
| user_id   | references |             |

### Association
- belongs to :user
- belongs to :item
- has_one    :address


addresses table　住所のテーブル
| Column         | Type     | Options     |
| --------       | ------   | ----------- |
| Postal code    | string   | null: false |
| Prefectures    | string   | null: false |
| Municipality   | text     | null: false |
| address        | string   | null: false |
| Building name  | text     | null: false |
| number         | string   | null: false |

### Association

- belongs to :order

