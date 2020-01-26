class AddColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :last_funded_date, :string
  end
end
