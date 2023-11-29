require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { User.create(name: 'テストユーザー', email: 'test@example.com', password: 'password') }

  describe 'バリデーション' do
    it 'タイトルが1文字以上255文字以下であれば有効' do
      list = user.lists.build(title: '有効なタイトル')
      expect(list).to be_valid
    end

    it 'タイトルが空であれば無効' do
      list = user.lists.build(title: '')
      expect(list).not_to be_valid
    end

    it 'タイトルが256文字以上であれば無効' do
      list = user.lists.build(title: 'a' * 256)
      expect(list).not_to be_valid
    end
  end

  describe '関連性' do
    it 'リストに属するカードが削除される' do
      list = user.lists.create(title: 'サンプルリスト')
      list.cards.create(title: 'サンプルカード')
      expect { list.destroy }.to change(Card, :count).by(-1)
    end
  end
end
