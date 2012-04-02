class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :person_id
      t.integer :offer_id
      t.boolean :accepted, :default => false

      t.timestamps
    end
  end
end
