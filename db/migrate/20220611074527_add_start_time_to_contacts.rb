class AddStartTimeToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :start_time, :datetime
  end
end
