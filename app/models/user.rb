class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  has_many :follow_questionnaires 
  has_many :questionnaires, through: :follow_questionnaires 

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

end
