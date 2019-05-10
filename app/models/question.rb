class Question < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :user
  
  has_many :answers
end
