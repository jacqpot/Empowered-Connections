class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.string :type
      t.belongs_to :user_id
      t.belongs_to :person_of_interest_id
      t.datetime :initial_contact
      t.timestamps
    end
  end
end
