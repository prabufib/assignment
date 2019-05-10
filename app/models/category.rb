class Category < ApplicationRecord
  belongs_to :admin_user
  has_many :questionnaires, dependent: :destroy

  after_save :update_alias_name

  def update_alias_name
  	self.update_column("alias_name", self.name.to_s.split(" ").join("-").downcase.first(25))
  end
end
