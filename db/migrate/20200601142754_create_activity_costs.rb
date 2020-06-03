class CreateActivityCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_costs do |t|
      t.integer :actual_cost, default: 0
      t.integer :service_tip, default: 0
      t.integer :employer_contribution, default: 0
      t.integer :total_balance, default: 0
      t.string :currency
      t.string :paid_by
      t.string :split_type
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
