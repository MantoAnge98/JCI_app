class AddColumnToPromotion < ActiveRecord::Migration[5.2]
  def change
    add_column :promotions, :year_promotion, :date
    add_column :promotions, :image_promotion, :string
  end
end
