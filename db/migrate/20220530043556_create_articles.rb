class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :status, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
