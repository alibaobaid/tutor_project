module NotificationPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :content
      t.add :sender_name
      t.add :sender_id
      t.add :is_new
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :index
  end
end
