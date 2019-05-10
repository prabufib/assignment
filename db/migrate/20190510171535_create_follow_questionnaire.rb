class CreateFollowQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_questionnaires do |t|
      t.references :user
      t.references :questionnaire
      t.timestamps
	end
  end
end
