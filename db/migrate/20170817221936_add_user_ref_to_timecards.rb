class AddUserRefToTimecards < ActiveRecord::Migration
  def change
    add_reference :timecards, :user, index: true
  end
end
