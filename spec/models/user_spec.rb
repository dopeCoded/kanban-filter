require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '名前が存在する場合は有効' do
      user = User.new(name: 'テストユーザー', email: 'test@example.com', password: 'password')
      expect(user).to be_valid
    end

    it '名前が空の場合は無効' do
      user = User.new(name: nil, email: 'test@example.com', password: 'password')
      expect(user).not_to be_valid
    end

    it '名前が20文字を超える場合は無効' do
      user = User.new(name: 'a' * 21, email: 'test@example.com', password: 'password')
      expect(user).not_to be_valid
    end
  end

  describe '関連性' do
    it 'ユーザーが削除されると、関連するリストも削除される' do
      user = User.create(name: 'テストユーザー', email: 'test@example.com', password: 'password')
      user.lists.create(title: 'サンプルリスト')
      expect { user.destroy }.to change(List, :count).by(-4) # デフォルトリスト3つと追加した1つ
    end
  end
end
