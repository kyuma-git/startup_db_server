class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :img
      t.string :description
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
