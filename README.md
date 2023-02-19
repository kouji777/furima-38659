# DB 設計

## users table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| nickname               | string              | null: false
| email                  | string              | null: false
| encrypted_password     | string              | null: false
| first_name             | string              | null: false
| first_name_kana        | string              | null: false
| family_name            | string              | null: false
| family_name_kana       | string              | null: false
| birth_day              | date                | null: false

### association

* has_many :products dependent: :destroy
* belongs_to :destination dependent: :destroy
* has_many :card dependent: :destroy

## products table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| name                   |string               |null: false
| price                  |integer              |null: false
| description            |text                 |null: false
| status_id              |integer              |null: false
| cost_id                |integer              |null: false
| days_id                |integer              |null: false
| item_condition_id      |integer              |null: false
| prefecture_id          |integer              |null: false
| category_id            |integer              |null: false,foreign_key:true
| user_id                |references           |null: false,foreign_key:true

### association

* belongs_to:user dependent: :destroy
* belongs_to:category dependent: :destroy
* has_many :images dependent: :destroy
* belongs_to_active_hash :prefecture
* has_many :card dependent: :destroy

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

### association

* has_many :card dependent: :destroy

## cards table

| Column                 | Type                |
Options                        |
|------------------------|---------------------|
---------------------------------|
| user_id                |integer              |null: false,foreign_key:true
| customer_id            |string               |null: false

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
