class Search
  include ActiveModel::Model
  include ActiveRecord::Callbacks
  include Virtus.model

  attr_accessor :available_users,
                :available_charities

  attribute :location, String
  attribute :languages, String
  attribute :industry, String
  attribute :charity_name, String
  attribute :country, String


  def with_constraints(constraints)
    constraints.each do |k,v|
      send("#{k}=",v)
    end
    self
  end


  def execute
    return available_users.where('1=0') if invalid?
    scoped = available_users
    scoped = scoped.where(users: {languages: languages}) if languages
    scoped = scoped.where(users: {location: location}) if location
    scoped = scoped.where(users: {industry: industry}) if industry
    scoped = scoped.includes(:charities).where(charities: {name: charity_name}) if charity_name
    scoped = scoped.includes(:charities).where(charities: {country: country}) if country
    scoped.order(first_name: :asc)
  end

end