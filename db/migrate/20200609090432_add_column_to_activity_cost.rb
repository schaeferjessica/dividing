class AddColumnToActivityCost < ActiveRecord::Migration[6.0]
  def change
    add_column :activity_costs, :outstanding, :float, default: 0.00
  end
end
