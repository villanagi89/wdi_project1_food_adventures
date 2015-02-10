class AddUserIdToJournals < ActiveRecord::Migration
  def change
    add_reference :journals, :user, index: true
    add_foreign_key :journals, :users
  end
end
