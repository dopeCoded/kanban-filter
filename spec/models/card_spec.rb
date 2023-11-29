require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:user) { User.create(name: 'テストユーザー', email: 'test@example.com', password: 'password') }
  let(:list) { user.lists.create(title: 'サンプルリスト') }

  describe 'バリデーション' do
    let(:card) { list.cards.build(title: 'テストタイトル') }

    it 'タイトルがない場合は無効であること' do
      card.title = nil
      expect(card).not_to be_valid
    end

    it 'タイトルが255文字を超える場合は無効であること' do
      card.title = 'a' * 256
      expect(card).not_to be_valid
    end

    it 'メモが1000文字以内の場合は有効であること' do
      card.memo = 'a' * 1000
      expect(card).to be_valid
    end

    it 'メモが1000文字を超える場合は無効であること' do
      card.memo = 'a' * 1001
      expect(card).not_to be_valid
    end

    it '重要度が high, medium, low, または nil の場合は有効であること' do
      ['high', 'medium', 'low', nil].each do |value|
        card.importance = value
        expect(card).to be_valid
      end
    end

    it '重要度が high, medium, low, nil 以外の場合は無効であること' do
      card.importance = '無効な値'
      expect(card).not_to be_valid
    end
  end
end
