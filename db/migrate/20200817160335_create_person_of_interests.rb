class CreatePersonOfInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :person_of_interests do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :occupation
      t.string :goals

      t.timestamps
    end
  end
end
