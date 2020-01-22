class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :images_tags, id: false do |t|
      t.belongs_to :image, index: true
      t.belongs_to :tag, index: true
    end

    create_table :images_users, id: false do |t|
      t.belongs_to :image, index: true
      t.belongs_to :user,  index: true
    end
  end
end
