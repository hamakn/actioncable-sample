class LoungeController < ApplicationController
  before_action :set_or_create_user

  def index
    @lounge_messages = LoungeMessage.includes(:user).all.order("id desc")
  end
end
