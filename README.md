# kanban
 Trelloにカレンダー機能をつけたものです。<br >
 タスクに締切日をつけるとカレンダーに同期されるため、いつまでに終わらせるタスクなのかをみることができます。 <br >
 尚、Doneに入っているタスクについてはカレンダーに同期されません。
<img width="1512" alt="スクリーンショット 2023-12-01 4 36 23" src="https://github.com/dopeCoded/kanban-filter/assets/100071732/afb1e393-add5-4236-b239-81c41c97ffd9">

# URL
https://kanban-app1-27c63b5047cd.herokuapp.com/ <br >
ゲストログインから、メールアドレスとパスワードを入力せずにログインできます。

# 使用技術
| 使用技術 | 詳細 |
|-----|-----|
| Rails (6.1.7.4)|  ウェブアプリケーションフレームワーク |
| MySQL | データベース| 
| Rspec | テストのフレームワーク| 
| Rubocop | コードスタイル| 
| Heroku | デプロイ先| 

# 機能一覧
| 機能名 | 説明 |
|-----|-----|
|ログイン機能|サインアップ・サイインイン・ログアウト|
|プロフィール機能|プロフィール情報を編集できます。|
|締切機能|タスクをカレンダーに同期し、締切日を把握できるようにする|
|重要度機能|カレンダー上のタスクを重要度で色分けする| 

### タスクの作成
<img width="1510" alt="スクリーンショット 2023-12-01 4 38 41" src="https://github.com/dopeCoded/kanban-filter/assets/100071732/d599e305-146b-4045-a137-478d4b21eb62">

### 締切機能、重要度機能
<img width="1136" alt="スクリーンショット 2023-12-01 4 33 46" src="https://github.com/dopeCoded/kanban-filter/assets/100071732/106eb470-89a2-4725-ae30-ad5c672ebdfe">

### プロフィール機能
<img width="664" alt="スクリーンショット 2023-12-01 4 37 29" src="https://github.com/dopeCoded/kanban-filter/assets/100071732/231443c7-71bf-4df7-a028-dc7c3f2a5727">

# ER図
<img width="420" alt="ER図" src="https://github.com/dopeCoded/kanban-filter/assets/100071732/8c32e71b-6ef5-4ba1-9966-63656195d006">

# 今後の課題
複数人でタスクを行うことを想定してタスクボードを他人と共有できる様な仕組みにできると良いと感じました。
