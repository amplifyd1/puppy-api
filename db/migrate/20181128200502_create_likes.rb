class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :post, foreign_key: true
      t.string :liked_by

      t.timestamps
    end
  end
end
