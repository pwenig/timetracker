class ChangeTimeOutColumn < ActiveRecord::Migration
  def change
    change_column :timecards, :time_out, :datetime, :default => nil
    
  end
end
