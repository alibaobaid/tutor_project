class V1::ConstantsController < V1::BaseController
  power :constants, map: {
    [:roles_list] => :constants_roles_list,
    [:gender_list] => :constants_gender_list,
  }, as: :constants_scope
  skip_before_action :authorize_request


  ## ------------------------------------------------------------ ##
  # GET /v2/constants/roles_list/
  def roles_list
    result = User.role_type.options.map do |text, value|
      {
        value: User.role_type.find_value(value).value,
        label: text
      }
    end
    render_success(
      data: {
        currency_types: result
      }
    )
  end

  # GET /v2/constants/gender_list/
  def gender_list
    result = User.gender.options.map do |text, value|
      {
        value: User.gender.find_value(value).value,
        label: text
      }
    end
    render_success(
      data: {
        currency_types: result
      }
    )
  end
  ## ------------------------------------------------------------ ##
end