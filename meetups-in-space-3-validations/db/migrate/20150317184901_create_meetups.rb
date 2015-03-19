class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :location, null: false
      t.datetime :start_time, default: DateTime.now
      t.datetime :end_time, default: DateTime.now
    end
  end
end
