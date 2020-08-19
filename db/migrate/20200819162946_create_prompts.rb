class CreatePrompts < ActiveRecord::Migration[6.0]
  def change
    create_table :prompts do |t|
      t.integer :person_of_interest_id
      t.string :description
      t.datetime :due_date
      t.string :notes

      t.timestamps
    end
  end
end
