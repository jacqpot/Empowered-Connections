class AddGoalsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :goals, :string
  end
end
