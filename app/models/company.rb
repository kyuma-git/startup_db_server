require 'csv'
class Company < ApplicationRecord
  # belongs_to :country
  scope :search, -> (search_params) do
    return if search_params.blank?
    name_like(search_params[:name])
    # country(search_params[:country])
    # .number_of_members(search_params[:members])
  end
  # scope :search, -> (search_params) do
  #   return if search_params.blank?
  #   country(search_params[:country_id])
  # end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :number_of_members, -> (members) { where('members <= ?', members)}
  scope :country, -> (country) {where(country: country) if country.present?}
  # scope :founded_from, -> (from) { where('? <= founded', from) if from.present? }
  # scope :founded_to, -> (to) { where('founded <= ?', to) if to.present? }
  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'UTF-8') do |row|
      company = find_by(id: row["id"]) || new
      company.attributes = row.to_hash.slice(*updatable_attributes)
      company.save!
    end
  end
  # def self.israel_import(file)
  #   CSV.foreach(file.path, headers: true, encoding: 'UTF-8') do |row|
  #     company = find_by(id: row["id"]) || new
  #     company.attributes = row.to_hash.slice(*updatable_attributes)
  #     company.save
  #   end
  # end
  def self.updatable_attributes
    [
      "id",
      "name",
      "description",
      "tag",
      "founder",
      "country_id",
      "total_fund_amount",
      "region",
      "established_date",
      # "last_funded_date",
      "created_at",
      "updated_at",
      "funding_stage",
      "members",
      "share_holder",
      "origin",
      "institute",
      "industry",
      "adress",
      "company_number",
      "phone_number",
      "company_url",
      "country"
    ]
    # ["id", "name", "description", "founded"]
  end
end