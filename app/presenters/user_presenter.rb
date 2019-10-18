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
      t.add :country
      t.add :city
      t.add :level
      t.add :subject
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :index
  end
end
