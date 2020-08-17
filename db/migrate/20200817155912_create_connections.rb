class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.string :description
      t.belongs_to :user
      t.belongs_to :person_of_interest
      t.datetime :initial_contact
      t.timestamps
    end
  end
end
