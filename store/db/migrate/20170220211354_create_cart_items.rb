class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.references :item, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer :quantity
    end
  end
end
