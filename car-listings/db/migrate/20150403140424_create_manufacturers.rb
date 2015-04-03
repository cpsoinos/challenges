class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name, null: false, unique: true
      t.string :country, null: false
    end
  end
end
