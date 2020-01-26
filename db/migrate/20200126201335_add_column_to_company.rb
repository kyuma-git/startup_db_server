class AddColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :country_id, :string
  end
end
