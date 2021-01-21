class ChangeIntegerLimitInUsersTable < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :telephone, :integer, limit: 8
  end
end
