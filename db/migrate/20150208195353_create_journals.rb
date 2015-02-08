class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :event_title
      t.datetime :event_date

      t.timestamps null: false
    end
  end
end
