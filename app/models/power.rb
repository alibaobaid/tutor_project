# frozen_string_literal: true

class Power
  include Consul::Power

  attr_reader :current_user, :params

  def initialize(current_user, params)
    @current_user = current_user
    @params = params
  end

  # Generate powers for all tables and by default prevent them all from access
  ActiveRecord::Base.connection.tables.map(&:to_sym) - %i[schema_migrations ar_internal_metadata].each do |model|
    power model do
      false
    end
  end
  ######################## CountriesController #######################
  
  power :countries_index,
  :countries_show,
  :creatable_countries,
  :updatable_countries,
  :destroyable_countries do
  Country
  end
  
  ######################## CitiesController #######################
  
  power :cities_index,
     :cities_show,
     :creatable_cities,
     :updatable_cities,
     :destroyable_cities do
  Country.find(params[:country_id])&.
         cities
  end
  
  ######################## V1::LevelsController #######################
  
  power :levels_index,
     :levels_show,
     :creatable_levels,
     :updatable_levels,
     :updatable_levels,
     :destroyable_levels do
  Level
  end
  
  ######################## V1::SubjectsController #######################
  
  power :subjects_index,
     :subjects_show,
     :creatable_subjects,
     :updatable_subjects,
     :destroyable_subjects do
  Subject
  end
  ######################## V1::UsersController #######################

  power :users_show,
        :creatable_users,
        :avatar_show do
  User
  end

  power :users_index do
    User.with_role_type('tutor')
  end

  power :constants_roles_list,
        :constants_gender_list do
      true
  end
end
