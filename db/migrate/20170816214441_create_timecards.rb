class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.text :tasks
      t.text :notes

      t.timestamps
    end
  end
end
