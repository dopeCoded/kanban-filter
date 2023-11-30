class TopController < ApplicationController
  def index
    @lists = List.where(user: current_user).order('created_at ASC')
    @lists_user = current_user.lists
  end
end
