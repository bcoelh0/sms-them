class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone_number
      t.integer :list_id

      t.timestamps
    end
  end
end
