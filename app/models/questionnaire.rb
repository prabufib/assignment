class Questionnaire < ApplicationRecord
  belongs_to :category
  has_many :questions

  has_many :follow_questionnaires
  has_many :users, through: :follow_questionnaires
end
