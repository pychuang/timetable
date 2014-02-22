class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.integer :company_id
      t.string :rank
      t.string :name
      t.string :number
      t.date :date
      t.boolean :clockwise
      t.integer :origin_id
      t.string :destination_id

      t.timestamps
    end
  end
end
