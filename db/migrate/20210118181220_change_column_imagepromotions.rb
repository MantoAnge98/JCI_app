class ChangeColumnImagepromotions < ActiveRecord::Migration[5.2]
  def change
    change_column :promotions, :image_promotion, :string, :default => false 
  end
end
