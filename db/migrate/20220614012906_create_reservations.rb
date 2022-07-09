class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date "day"
      t.string "time"
      t.datetime "start_time"
      t.timestamps
    end
  end
end
