RailsAdmin.config do |config|

  ### Popular gems integration
  config.included_models =  ['User', 'Country', 'Level', 'City', 'Subject']
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan
  config.model 'User' do
    list do
      field :first_name
      field :last_name
      field :role_type
      field :phone_number
      field :status
    end
    
    show do
      include_all_fields
      exclude_fields :id, :password_digest, :reset_password_token, :reset_password_token_expires_at
    end

    edit do
      include_all_fields
      exclude_fields :id, :password_digest, :reset_password_token, :reset_password_token_expires_at
    end

    create do
      include_all_fields
      exclude_fields :id, :password_digest, :reset_password_token, :reset_password_token_expires_at
    end
  end

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
