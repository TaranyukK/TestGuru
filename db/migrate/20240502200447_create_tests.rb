class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.string :level
      t.references :category_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
