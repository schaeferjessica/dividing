class CreateActivityCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_costs do |t|
      t.integer :actual_cost
      t.integer :service_tip
      t.integer :employer_contribution
      t.integer :total_balance
      t.string :currency
      t.string :split_type
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
