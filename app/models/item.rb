class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  validates :image, :name, :description, :detail_id, :regarding_delivery_id, :selling_price_id, :category_id, :prefecture_id,
            :value, presence: true

  validates :category_id, :detail_id, :prefecture_id, :regarding_delivery_id, :selling_price_id, numericality: { other_than: 0 }
  validates_inclusion_of :value, in: 300..9_999_999, message: 'This site is only for under 300 and over 9,999,999'
  validates :value, numericality: { with: /\A[0-9]+\z/ }
  #validates :value, numericality: { with: /\A[a-zA-Z]+\z/ }←エラーが発生していて、この記述tを書いたらテストが通ったから。
end
