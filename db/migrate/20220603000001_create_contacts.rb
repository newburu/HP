class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|t
      
      t.string    :name,              null: false
      t.string    :name_hiragana,     null: false
      t.string    :email,             null: false
      t.string    :matter,            null: false
      t.string    :menu
      t.string    :discount
      t.string    :payment
      t.text      :content,           null: false
      t.timestamps
    end
  end
end