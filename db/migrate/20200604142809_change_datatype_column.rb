class ChangeDatatypeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :activity_costs, :actual_cost, :float
    change_column :activity_costs, :service_tip, :float
    change_column :activity_costs, :employer_contribution, :float
    change_column :activity_costs, :total_balance, :float, default: 0.0
    change_column :splits, :individual_balances, :float
  end
end
