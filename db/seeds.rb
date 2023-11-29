# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ユーザーデータの作成
user1 = User.create(name: 'ユーザー1', email: 'user1@example.com', password: 'password', password_confirmation: 'password')
user2 = User.create(name: 'ユーザー2', email: 'user2@example.com', password: 'password', password_confirmation: 'password')

# List データの作成
list1 = user1.lists.create(title: 'ユーザー1のリスト1')
list2 = user1.lists.create(title: 'ユーザー1のリスト2')
list3 = user2.lists.create(title: 'ユーザー2のリスト1')

# Card データの作成
list1.cards.create(title: 'カード1', memo: 'メモ1', importance: 'high')
list1.cards.create(title: 'カード2', memo: 'メモ2', importance: 'medium')

list2.cards.create(title: 'カード3', memo: 'メモ3', importance: 'low')
list2.cards.create(title: 'カード4', memo: 'メモ4', importance: nil)

list3.cards.create(title: 'カード5', memo: 'メモ5', importance: 'high')
list3.cards.create(title: 'カード6', memo: 'メモ6', importance: 'medium')
