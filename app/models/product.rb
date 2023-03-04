class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  * belongs_to :user 
  * has_one : purchase_record
  # has_many :comments

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date

  # active_storageとのアソシエーション
  # （items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image


end
