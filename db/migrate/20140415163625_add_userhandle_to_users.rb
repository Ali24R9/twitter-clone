class AddUserhandleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userhandle, :string
  end
end
