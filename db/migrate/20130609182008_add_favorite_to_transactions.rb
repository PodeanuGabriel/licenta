class AddFavoriteToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :favorite, :integer
  end
end
