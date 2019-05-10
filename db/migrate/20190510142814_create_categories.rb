class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :alias_name
      t.references :admin_user
      t.timestamps
    end
  end
end