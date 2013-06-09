class AddSavingsToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :savings, :string
  end
end
