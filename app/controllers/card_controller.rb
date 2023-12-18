class CardController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]

  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])

    return unless @list.nil?

    # フラッシュメッセージでエラーを通知
    flash.now[:alert] = '指定されたリストが見つかりません。'
    # 同じページに留まるために、新しいカードオブジェクトを再度作成
    @card = Card.new
    # newテンプレートを再度レンダリング
    render :new
  end

  def create
    @card = Card.new(card_params)
    if @card.list
      # リスト内の最後のカードのpositionを取得し、新しいカードのpositionを設定
      last_position = @card.list.cards.maximum(:position) || 0
      @card.position = last_position + 1
    end

    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
    @lists = List.where(user: current_user)
  end

  def update
    if @card.update(card_params)
      redirect_to :root
    else
      # 更新に失敗した場合、@lists を再設定
      @lists = List.where(user: current_user)
      render action: :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to :root
  end

  def update_list
    Card.transaction do
      # params[:order] を配列に変換し、各カードの position を更新
      order = params[:order].split(',')
      order.each_with_index do |card_id, index|
        Card.find(card_id).update!(list_id: params[:list_id], position: index)
      end
    end

    render json: { message: 'Card updated successfully.' }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def card_params
    params.require(:card).permit(:title, :memo, :list_id, :deadline, :importance)
  end

  def set_card
    @card = Card.find_by(id: params[:id])
  end
end
