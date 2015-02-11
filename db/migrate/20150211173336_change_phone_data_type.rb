class ChangePhoneDataType < ActiveRecord::Migration
  def change
    change_column :adventures, :phone, :string, :limit => 20
  end
end
