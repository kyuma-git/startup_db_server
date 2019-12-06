require 'csv'

class Company < ApplicationRecord
  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
  end
  scope :search_founded, -> (search_params) do
    return if search_params.blank?

    founded_from(search_params[:founded])
      .founded_to(search_params[:founded])
  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :founded_from, -> (from) { where('? <= founded', from) if from.present? }
  scope :founded_to, -> (to) { where('founded <= ?', to) if to.present? }

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      company = find_by(id: row["id"]) || new
      company.attributes = row.to_hash.slice(*updatable_attributes)
      company.save
    end
  end

  def self.updatable_attributes
    ["id", "name", "adress", "founded", "country_id"]
  end
end
