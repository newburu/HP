class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :image
      t.text :note
      t.timestamps
    end
  end
end
