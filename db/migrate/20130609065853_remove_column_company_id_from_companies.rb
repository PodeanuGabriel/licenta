class RemoveColumnCompanyIdFromCompanies < ActiveRecord::Migration
  def up
    remove_column :categories, :category_id
  end

  def down
  end
end
