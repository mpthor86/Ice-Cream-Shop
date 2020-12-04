class CreateIceCreamTable < ActiveRecord::Migration
  def change
    create_table :ice_creams do |t|
      t.string :flavor
      t.string :toppings
      t.integer :rating
      t.integer :user_id
    end
  end
end
