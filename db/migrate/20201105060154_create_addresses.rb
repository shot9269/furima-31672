class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer   :postal_code,     null: false
      t.integer   :prefecture_id,   null: false
      t.string    :city,            null: false
      t.string    :area,            null: false
      t.string    :building
      t.integer   :phone_number,    null: false, limit: 8
      t.references :item,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
