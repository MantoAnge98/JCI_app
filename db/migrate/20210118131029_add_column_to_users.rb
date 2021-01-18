class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :date
    add_column :users, :profession, :string
  end
end
