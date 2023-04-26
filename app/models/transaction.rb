class Transaction < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    has_and_belongs_to_many :categories, dependent: :destroy, foreign_key: 'categories_id'

    validates :name, presence: true, length: { maximum: 255 }
    validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
