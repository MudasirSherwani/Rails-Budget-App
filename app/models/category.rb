class Category < ApplicationRecord
    belongs_to :users, class_name: 'User', foreign_key: 'users_id'
    has_many :transactions, dependent: :destroy

    validates :name, presence: true, length: { maximum: 200 }
    has_one_attached :icon, dependent: :destroy

  def total_amount
    transactions.sum(:amount)
  end
end
