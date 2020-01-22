class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :img
      t.integer :user_id
      t.boolean :favorite

      t.timestamps
    end
  end
end
