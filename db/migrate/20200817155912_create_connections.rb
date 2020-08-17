class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.string :type
      t.integer :user_id
      t.integer :person_of_interest_id

      t.timestamps
    end
  end
end
