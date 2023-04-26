class User < ApplicationRecord
    has_many :categories, foreign_key: 'user_id'
    has_many :transactions, foreign_key: 'user_id'

    validates :name, presence: true, length: => { maximum: 50 }
end
