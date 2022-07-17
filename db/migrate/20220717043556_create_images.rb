class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :file
      t.text :note
      t.timestamps
    end
  end
end
