class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :post_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
