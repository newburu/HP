class AddContactIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :contact_id, :integer
  end
end
