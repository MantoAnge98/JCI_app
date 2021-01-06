class AddMultiRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :group, foreign_key: true
    add_reference :users, :payment, foreign_key: true
    add_reference :users, :setting, foreign_key: true
  end
end
