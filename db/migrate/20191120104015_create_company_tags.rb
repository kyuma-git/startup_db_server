class CreateCompanyTags < ActiveRecord::Migration[5.2]
  def change
    create_table :company_tags do |t|
      t.references :company, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      t.timestamps
    end
  end
end
