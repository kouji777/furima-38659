# DB 設計

## users table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| nickname               | string              | null: false
| email                  | string              | null: false
| password               | string              | null: false
| user_image             | string              | 
| first_name             | string              | null: false
| first_name_kana        | string              | null: false
| family_name            | string              | null: false
| family_name_kana       | string              | null: false
| birth_day              | date                | null: false
| phone_number           | string              |

### association

* has_many :products dependent: :destroy
* belongs_to :destination dependent: :destroy
* belongs_to :card dependent: :destroy

## product table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| name                   |string               |null: false
| price                  |string               |null: false
| description            |string               |null: false
| status                 |string               |null: false
| cost                   |string               |null: false
| days                   |string               |null: false
| item_condition         |string               |null: false
| prefecture_id          |string               |null: false
| category_id            |string               |null: false,foreign_key:true
| user_id                |string               |null: false,foreign_key:true

### association

* belongs_to:user dependent: :destroy
* belongs_to:category dependent: :destroy
* has_many :images dependent: :destroy
* belongs_to_active_hash :prefecture

## destination table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| first_name             |string               |null: false
| first_name_kana        |string               |null: false
| family_name            |string               |null: false
| family_name_kana       |string               |null: false
| post_code              |string               |null: false
| prefecture             |string               |null: false
| city                   |string               |null: false
| address                |string               |null: false
| building_name          |string               |
| phone_number           |string               |
| user_id                |integer              |null: false,foreign_key:true

### association

* belongs_to :user

## card table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| user_id                |integer              |null: false,foreign_key:true
| customer_id            |string               |null: false
| card_id                |string               |null: false

### association

* belongs_to :user

## category table
| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| name                   |string               |null: false
| ancestry               |string               |

### association

* has_many :products

## image table
| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| image                  |string               |null: false
| product_id             |integer              |null: false,foreign_key:true

### association

* belongs_to_product
