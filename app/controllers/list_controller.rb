class ListController < ApplicationController
  before_action :set_list, only: %i(edit update destroy)
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
  end

  def ids
    @lists = current_user.lists.select(:id, :title) # Adjust according to your user association
    render json: @lists
  end

  def update
    if @list.update(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def update_order
    puts "Received list_order: #{params[:list_order].inspect}"
    params[:list_order].each do |list_order|
      list = List.find(list_order[:id])
      list.update(order: list_order[:order])
    end

    render json: { status: 'success' }
  rescue => e
    render json: { status: 'error', message: e.message }
  end

  def destroy
    @list.destroy
    redirect_to :root
  end

  private
    def list_params
      params.require(:list).permit(:title).merge(user: current_user)
    end

    def set_list
      @list = List.find_by(id: params[:id])
    end
end
