class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :text
      t.string :for_sex
      t.decimal :value

      t.timestamps
    end
  end
end
