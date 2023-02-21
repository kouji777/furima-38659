# DB 設計

## users table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| nickname               | string              | null: false
| email                  | string              | unique: true
| encrypted_password     | string              | null: false
| first_name             | string              | null: false
| first_name_kana        | string              | null: false
| family_name            | string              | null: false
| family_name_kana       | string              | null: false
| birth_day              | date                | null: false

### association

* has_many :products
* has_many :purchase record
* has_one :destination

## products table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| name                   |string               |null: false
| price                  |integer              |null: false
| description            |text                 |null: false
| cost_id                |integer              |null: false
| shipment_id            |integer              |null: false
| item_condition_id      |integer              |null: false
| prefecture_id          |integer              |null: false
| category_id            |integer              |null: false,foreign_key:true
| user                |references           |null: false,foreign_key:true

### association

* belongs_to :user 
* belongs_to :category 
* has_one : purchase records
* has_one : destination

## destinations table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| post_code              |string               |null: false
| prefecture_id          |integer              |null: false
| city                   |string               |null: false
| address                |string               |null: false
| building_name          |string               |
| phone_number           |string               |null: false
| user_id                |integer              |null: false
| product_id            |integer              |null: false
### association

* belongs_to :purchase record
* belongs_to :product
* belongs_to :user

## Purchase records table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| user_id                |integer              |null: false,foreign_key:true
| product_id            |integer              |null: false,
foreign_key:true

### association

* belongs_to :user
* belongs_to :product
* has_one :destination

## category table
| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| name                   |string               |null: false
| ancestry               |string               |

### association

* has_many :products
