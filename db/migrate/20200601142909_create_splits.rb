class CreateSplits < ActiveRecord::Migration[6.0]
  def change
    create_table :splits do |t|
      t.references :activity_cost, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.integer :individual_balances
      t.string :payment_type
      t.boolean :status

      t.timestamps
    end
  end
end
