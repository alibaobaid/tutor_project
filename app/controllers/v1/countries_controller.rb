# frozen_string_literal: true

class V1::CountriesController < V1::BaseController
  power :countries, map: {
    [:index]   => :countries_index,
    [:show]    => :countries_show,
    [:create]  => :creatable_countries,
    [:update]  => :updatable_countries,
    [:destroy] => :destroyable_countries
  }, as: :countries_scope

  ## ------------------------------------------------------------ ##

  # GET : /v1/countries/
  # Inherited from V1::BaseController
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST : /v1/countries/
  # Inherited from V1::BaseController
    # def create; end
    
  ## ------------------------------------------------------------ ##

  # GET : /v1/countries/:id
  # Inherited from V1::BaseController
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/countries/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/countries/:id
  # Inherited from V1::BaseController
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def country_params
    params.require(:country).permit(:name)
  end
end
