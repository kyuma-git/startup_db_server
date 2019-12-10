class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :description
      t.string :tag
      t.string :founder
      t.string :total_fund_amount
      t.string :region
      t.string :established_date
      t.datetime :created_at
      t.datetime :updated_at
      t.string :funding_stage
      t.string :members
      t.string :share_holder
      t.string :origin
      t.string :institute
      t.string :industry
      t.string :adress
      t.string :company_number
      t.string :phone_number
      t.string :this_url
      t.string :company_url
      t.integer :acquired
      t.integer :active
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :linkedin
      t.string :country
      t.timestamps
    end
  end
end