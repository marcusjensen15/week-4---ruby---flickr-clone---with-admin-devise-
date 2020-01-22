class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many (:images)
  has_and_belongs_to_many (:images)
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
