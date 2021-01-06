class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.date :date_payment
      t.text :note
      t.integer :pay_amount
      
      t.timestamps
    end
  end
end
