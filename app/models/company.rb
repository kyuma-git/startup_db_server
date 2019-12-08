require 'csv'

class Company < ApplicationRecord
  belongs_to :country

  scope :search_by_name, -> (search_params) do
    return if search_params.blank?
    name_like(search_params[:name])
    .number_of_members(search_params[:members])
  end

  scope :search, -> (search_params) do
    return if search_params.blank?
    country(search_params[:country_id])
  end

  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :number_of_members, -> (members) { where('members <= ?', members)}
  scope :country, -> (country_id) {where(country_id: country_id) if country_id.present?}
  # scope :founded_from, -> (from) { where('? <= founded', from) if from.present? }
  # scope :founded_to, -> (to) { where('founded <= ?', to) if to.present? }

  def self.japan_import(file)
    CSV.foreach(file.path, headers: true, encoding: 'UTF-8') do |row|
      company = find_by(id: row["id"]) || new
      company.attributes = row.to_hash.slice(*updatable_attributes)
      company.save
    end
  end

  def self.updatable_attributes
    ["id", "name", "adress", "founded", "members", "country_id"]
  end

  def self.israel_import(file)
    CSV.foreach(file.path, headers: true, encoding: 'UTF-8') do |row|
      company = find_by(id: row["id"]) || new
      company.attributes = row.to_hash.slice(*updatable_attributes)
      company.save
    end
  end

  def self.updatable_attributes
    ["id", "name", "adress", "founded", "members", "country_id"]
  end

end
