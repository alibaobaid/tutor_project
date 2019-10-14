# frozen_string_literal: true

class V1::LevelsController < V1::BaseController
  power :levels, map: {
    [:index]   => :levels_index,
    [:show]    => :levels_show,
    [:create]  => :creatable_levels,
    [:update]  => :updatable_levels,
    [:destroy] => :destroyable_levels
  }, as: :levels_scope

  ## ------------------------------------------------------------ ##

  # GET : /v1/levels/
  # Inherited from V1::BaseController
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST : /v1/levels/
  # Inherited from V1::BaseController
  # def create; end

  ## ------------------------------------------------------------ ##

  # GET : /v1/levels/:id
  # Inherited from V1::BaseController
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/levels/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/levels/:id
  # Inherited from V1::BaseController
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def level_params
    params.require(:level).permit(:name)
  end
end
