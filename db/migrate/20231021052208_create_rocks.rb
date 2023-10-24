class CreateRocks < ActiveRecord::Migration[7.0]
  def change
    create_table :rocks do |t|
      t.string :type
      t.decimal :daily_price
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
