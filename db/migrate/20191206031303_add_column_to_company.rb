class AddColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :members, :integer
  end
end
