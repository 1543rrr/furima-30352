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
- belongs to address   


items table　商品の出品(出品画像,商品名,商品の説明,商品の詳細,配送について,販売価格)
| Column               | Type       | Options     |
| --------             | ------     | ----------- |
| images               | string     | null: false |
| item_names           | text       | null: false |
| item_description     | text       | null: false |
| item_details         | text       | null: false |
| regarding_delivery   | text       | null: false |
| selling_prices       | text       | null: false |

### Association
- belongs to :order
- has many   :user


orders table　商品の購入
| Column    | Type       | Options     
| --------  | -----------| ----------- |
| item_id   | references | null: false |
| user_id   | references | null: false |

### Association
- belongs to :user
- belongs to :item


addresses table　住所のテーブル
| Column         | Type     | Options     |
| --------       | ------   | ----------- |
| Postal code    | integer  | null: false |
| Prefectures    | string   | null: false |
| Municipality   | text     | null: false |
| address        | integer  | nill: false |
| Building name  | text     |             |
| number         | integer  | null: false |

### Association
- belongs to :user
- belongs to :order

