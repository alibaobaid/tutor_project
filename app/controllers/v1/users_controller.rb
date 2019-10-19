# app/controllers/users_controller.rb
class V1::UsersController < V1::BaseController
  power :users, map: {
    [:index]   => :users_index,
    [:show]    => :users_show,
    [:create]  => :creatable_users,
    [:avatar]  => :avatar_show

  }, as: :users_scope

  skip_before_action :authorize_request, only: [:create, :avatar, :index, :show]
  # GET index
  def index
    @users = if params[:search].present?
      User.joins(:country, :city, :subject, :level).where(
        "
          lower(country.name) LIKE :country OR
          lower(city.name) LIKE :city OR
          lower(level.name) LIKE :level OR
          lower(subject.name) LIKE :subject
        ",
        country: "%#{params[:search][:country].downcase}%",
        city: "%#{params[:search][:city].downcase}%",
        subject: "%#{params[:search][:subject].downcase}%",
        level: "%#{params[:search][:level].downcase}%"
      )
    else
      users_scope
    end
    data = {
      users: @users.as_api_response(:index),
      pagination: pagination(collection)
    }

    render_success(data: data, message: index_message)
  end
  
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.new(user_params)
    # auth_token = AuthenticateUser.new(user.email, user.password).call
    # response = { message: Message.account_created, auth_token: auth_token }
    # json_response(response, :created)
    # render_created(data: response, message: created_message)
    if user.save
      auth_token = AuthenticateUser.new(user.email, user.password).call
      user = { user: user.as_api_response(:show), auth_token: auth_token }
      render_created(data: user, message: created_message)
    else
      render_unprocessable_entity(error: user)
    end
  end

  # GET /avatar
  def avatar
    user = User.find_by(id: params[:id])
  
    if user&.avatar&.attached?
      redirect_to rails_blob_url(user.avatar)
    else
      head :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :nationality,
      :gender,
      :hour_amount,
      :bio,
      :role_type,
      :email,
      :country_id,
      :city_id,
      :level_id,
      :subject_id,
      :password,
      :password_confirmation,
      :avatar
    )
  end
end
