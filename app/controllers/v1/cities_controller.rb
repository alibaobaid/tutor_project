# frozen_string_literal: true

class V1::CitiesController < V1::BaseController
  power :cities, map: {
    [:index]   => :cities_index,
    [:show]    => :cities_show,
    [:create]  => :creatable_cities,
    [:update]  => :updatable_cities,
    [:destroy] => :destroyable_cities
  }, as: :cities_scope

  ## ------------------------------------------------------------ ##

  # GET : /v1/countries/#{country_id}/cities
  # Inherited from V1::BaseController
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST : /v1/cities/
  # Inherited from V1::BaseController
  # def create; end

  ## ------------------------------------------------------------ ##

  # GET : /v1/countries/#{country_id}/cities/#{id}
  # Inherited from V1::BaseController
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/cities/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/cities/:id
  # Inherited from V1::BaseController
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def city_params
    params.require(:city).permit(:name)
  end

  # Search filters
  # def search_params; end

  # Custom ordering and sorting
  # def get_order; end
end
