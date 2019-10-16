# frozen_string_literal: true

class V1::SubjectsController < V1::BaseController
  power :subjects, map: {
    [:index]   => :subjects_index,
    [:show]    => :subjects_show,
    [:create]  => :creatable_subjects,
    [:update]  => :updatable_subjects,
    [:destroy] => :destroyable_subjects
  }, as: :subjects_scope

  skip_before_action :authorize_request, only: :index

  ## ------------------------------------------------------------ ##

  # GET : /v1/subjects/
  # Inherited from V1::BaseController
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST : /v1/subjects/
  # Inherited from V1::BaseController
  # def create; end

  ## ------------------------------------------------------------ ##

  # GET : /v1/subjects/:id
  # Inherited from V1::BaseController
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/subjects/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/subjects/:id
  # Inherited from V1::BaseController
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def subject_params
    params.require(:subject).permit(:name)
  end
end
