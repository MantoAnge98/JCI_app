class ChangeColumnAvatarToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :avatar, :string,  null: true
  end
end
