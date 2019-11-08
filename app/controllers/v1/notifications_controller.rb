class V1::NotificationsController < V1::BaseController
  power :notifications, map: {
    [:index]   => :notifications_index,
    [:show]    => :notifications_show,
    [:create]  => :creatable_notifications,
    [:update]  => :updatable_notifications,
    [:destroy] => :destroyable_notifications
  }, as: :notifications_scope

  ## ------------------------------------------------------------ ##

  # GET : /v1/notifications/
  def index
    collection.update_all(is_new: false)
    super
  end

  ## ------------------------------------------------------------ ##

  # POST : /v1/notifications/
  # def create; end

  ## ------------------------------------------------------------ ##

  # GET : /v1/notifications/:id
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/notifications/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/notifications/:id
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def notification_params
    params
    .require(:notification)
    .permit(
      :content,
      :receiver_id
    )
  end
end
