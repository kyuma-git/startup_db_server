class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.references :country, null: false, foreign_key: true
      t.string :description
      t.string :adress
      t.string :this_url
      t.string :company_url
      t.references :city, foreign_key: true
      t.references :stage, foreign_key: true
      t.integer :acquired
      t.integer :active
      t.datetime :founded
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :linkedin

      t.timestamps
    end
  end
end
