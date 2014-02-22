class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.integer :train_id
      t.integer :depart_from_id
      t.datetime :depart_at
      t.integer :arrive_to_id
      t.datetime :arrive_at

      t.timestamps
    end
  end
end
