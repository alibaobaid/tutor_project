module UserPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :first_name
      t.add :last_name
      t.add :nationality
      t.add :gender
      t.add :hour_amount
      t.add :bio
      t.add :role_type
      t.add :email
      t.add :country_id
      t.add :country_name
      t.add :city_id
      t.add :city_name
      t.add :level_id
      t.add :level_name
      t.add :subject_id
      t.add :subject_name
      t.add :avatar_url, as: :avatar
    end

    api_accessible :index, extend: :base

    api_accessible :show do |t|
      t.add :id
      t.add :first_name
      t.add :last_name
      t.add :nationality
      t.add :gender
      t.add :hour_amount
      t.add :bio
      t.add :role_type
      t.add :email
      t.add :phone_number
      t.add :country_id
      t.add :country_name
      t.add :city_id
      t.add :city_name
      t.add :level_id
      t.add :level_name
      t.add :subject_id
      t.add :subject_name
      t.add :can_update_profile?, as: :can_update_profile
      t.add :avatar_url, as: :avatar
      t.add :new_notification_count
    end
  end
end
