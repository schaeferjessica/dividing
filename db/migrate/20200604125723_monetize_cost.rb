class MonetizeCost < ActiveRecord::Migration[6.0]
  def change
    add_monetize :splits, :individual_balances, currency: { present: true }
    add_monetize :activity_costs, :actual_cost, currency: { present: true }
  end
end
