class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :transactions
  has_many :products, through: :transactions
  has_many :subordinates, class_name: "User",
                          foreign_key: "manager_id"
  belongs_to :manager, class_name: "User", optional: true
end
