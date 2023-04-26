class Category < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    has_many :transactions, dependent: :destroy, foreign_key: 'tr_id'

    validates :name, presence: true, length: { maximum: 200 }
    has_one_attached :icon

  def total_amount
    transactions.sum(:amount)
  end
end
