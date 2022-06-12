class AddDetailToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :day, :date
    add_column :contacts, :time, :string
  end
end
