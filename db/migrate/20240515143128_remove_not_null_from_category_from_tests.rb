class RemoveNotNullFromCategoryFromTests < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tests, :category_id, true
  end
end
