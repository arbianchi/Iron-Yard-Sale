class AddCompletedRefundedColumnsToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :completed,   :boolean, default: false, null: false
    add_column :transactions, :refunded,    :boolean, default: false, null: false
  end
end
