class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_operations, class_name: 'Operation', foreign_key: 'author_id'

  has_many :categories
  has_many :operations

  validates :name, :email, :password, presence: true, length: { minimum: 3, maximum: 50 }
end
