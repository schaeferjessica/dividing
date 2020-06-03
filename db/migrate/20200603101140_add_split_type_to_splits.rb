class AddSplitTypeToSplits < ActiveRecord::Migration[6.0]
  def change
    add_column :splits, :split_type, :string
  end
end
