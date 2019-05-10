class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.text :description
      t.references :questionnaire
      t.references :user
      t.timestamps
    end
  end
end
