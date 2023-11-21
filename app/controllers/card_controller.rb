class CardController < ApplicationController
  before_action :set_card, only: %i(show edit update destroy)

  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])

    if @list.nil?
      # フラッシュメッセージでエラーを通知
      flash.now[:alert] = "指定されたリストが見つかりません。"
      # 同じページに留まるために、新しいカードオブジェクトを再度作成
      @card = Card.new
      # newテンプレートを再度レンダリング
      render :new
    end
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def show
  end

  def edit
    @lists = List.where(user: current_user)
  end

  def update
    if @card.update(card_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to :root
  end

  def update_list
    card = Card.find(params[:id])
    if card.update(list_id: params[:list_id])
      # Handle successful update
      render json: { message: "Card updated successfully." }, status: :ok
    else
      # Handle update failure
      render json: { errors: card.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id, :deadline)
    end

    def set_card
      @card = Card.find_by(id: params[:id])
    end
end
