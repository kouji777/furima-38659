# DB 設計

## users table

| Column          | Type             |Options        |
| -------------| -------------|-------------|
| nickname        | string           | null: false     |
| email           | string           | unique: true, null: false  |
| encrypted_password| string         | null: false  |
| first_name      | string           | null: false  |
| first_name_kana | string           | null: false  |
| family_name     | string           | null: false  |
| family_name_kana| string           | null: false  |
| birth_day       | date             | null: false  |

### association

* has_many :items
* has_many :purchase_records

## items table

| Column          | Type             |Options        |
| -------------| -------------|-------------|
| name            | string            | null: false  |
| price           | integer           | null: false  |
| description     | text              | null: false  |
| category_id     | integer           | null: false  |
| cost_id         | integer           | null: false  |
| shipment_id     | integer           | null: false  |
| item_condition_id | integer         | null: false  |
| prefecture_id   | integer           | null: false  |
| user            | references        | null: false,foreign_key:true  |

### association

* belongs_to :user 
* has_one : purchase_record

## destinations table

| Column          | Type             |Options        |
| -------------| -------------|-------------|
| post_code       | string            | null: false  | 
| prefecture_id   | integer           | null: false  |
| city            | string            | null: false  |
| address         | string            | null: false  |
| building_name   | string            |
| phone_number    | string            | null: false  |
| purchase_record | references        | null: false,foreign_key:true  |
### association

* belongs_to :purchase_record

## purchase_records table

| Column          | Type             |Options        |
| -------------| -------------|-------------|
| user            | references        | null: false,foreign_key:true  |
| item            | references        | null: false,foreign_key:true  |

### association

* belongs_to :user
* belongs_to :item
* has_one :destination