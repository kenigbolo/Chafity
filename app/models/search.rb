class Search
  include ActiveModel::Model
  include ActiveRecord::Callbacks
  include Virtus.model

  attr_accessor :available_users,
                :available_charities

  attribute :location, String
  attribute :languages, String
  attribute :industry, String
  attribute :charity_id, Integer
  attribute :country, String
  attribute :search, String

  before_create :set_empty_string_values_to_nil


  def with_constraints(constraints)
    constraints.each do |k,v|
      send("#{k}=",v)
    end
    self
  end

  def set_empty_string_values_to_nil
    attributes.each do |k,v|
      byebug
      self[k] = nil if v.blank?
    end
  end


  def execute
    return available_users.where('1=0') if invalid?

    scoped = available_users
    scoped = scoped.search(search)                            if search.present?
    scoped = scoped.where(users: {languages: languages}) if languages.present?
    scoped = scoped.where(users: {location: location}) if location.present?
    scoped = scoped.where(users: {industry: industry}) if industry.present?
    scoped = scoped.where('users.charity_id = ?', charity_id) if charity_id.present?
    scoped.reorder(first_name: :asc)
  end
end