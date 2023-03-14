class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user
  has_one :purchase_record
  # has_many :comments

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :item_condition
  belongs_to :cost
  belongs_to :shipment

  # active_storageとのアソシエーション
  # （items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_condition_id
    validates :cost_id
    validates :prefecture_id
    validates :shipment_id
    # 300円以上かつ9,999,999円以下で、半角数字かつ整数値のみでないと入力不可
    validates :price, numericality: {only_integer:true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
  end

  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :item_condition_id
    validates :cost_id
    validates :shipment_id
  end
end
