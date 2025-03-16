class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string  :title,       null: false
      t.text    :description
      t.date    :occurred_on, null: false
      t.references :user,   null: false, foreign_key: true
      t.references :place,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
rails db:migrate