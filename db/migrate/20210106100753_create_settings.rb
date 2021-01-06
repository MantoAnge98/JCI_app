class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :amount_due
      t.string :devise

      t.timestamps
    end
  end
end
