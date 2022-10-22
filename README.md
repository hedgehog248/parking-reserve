# アプリケーション名
ABCマンション(仮)来客用駐車場予約アプリ『オサエトコ』  


# アプリケーション概要
実在のマンションをモデルとした「ABCマンション」における、来客用駐車場の予約管理と利用申請、利用許可証の発行ができるウェブアプリケーション。  


# URL
https://parking-reserve-38018.herokuapp.com/  


# テスト用アカウント
* Basic認証ID: admin  

* Basic認証パスワード: 9900  

* 利用者メールアドレス: test@test  

* 利用者パスワード: 1111aaaa  

# 利用方法
## 空き状況の確認・新規予約
1. トップページのヘッダーから予約表をクリック。
1. カレンダーから確認したい日付をクリック。
1. その日の空き状況がタイムテーブルで表示される。
1. 新規予約の場合は、タイムテーブル上の開始希望時間枠をクリック。
1. 予約画面で終了日時を選択し、予約ボタンを押す。
1. 予約可能な場合は確認画面になるので、予約確定ボタンを押す。

## 予約の確認
1. トップページ(タイトルロゴをクリック)に遷移する。
1. 現在有効な予約があれば表示される。

## 予約の削除
1. トップページの各予約リストにある削除ボタンを押す。
1. 確認のポップアップのOKを押す。

## 利用許可証の申請
1. トップページ(タイトルロゴをクリック)に遷移する。
1. 申請したい予約にある許可証の申請ボタンを押す。
1. 必要事項を入力し、申請ボタンを押す。

## 利用許可証申請内容の変更
1. トップページ(タイトルロゴをクリック)に遷移する。
1. 申請したい予約にある許可証申請の変更ボタンを押す。
1. 修正事項を入力し、変更の申請ボタンを押す。

## 利用許可証の表示・印刷
1. 上記 利用許可証の申請（または変更）後、トップページにある該当する予約リストにある利用許可証の表示・印刷ボタンを押す。
1. ダウンロードまたは印刷が可能。

## 利用者情報の確認
1. ヘッダーの利用者情報をクリックで表示。

## 利用者情報の編集・削除
1. ヘッダーの利用者情報をクリック。
1. 編集ボタンまたは削除ボタンを押す。（削除時には確認用ポップアップが出るのでOKを押す）

## 車両情報の新規登録
1. ヘッダーの利用者情報をクリック。
1. 車両情報の新規登録ボタンを押す。
1. 必要事項を入力し、登録ボタンを押す。

## 車両情報の編集・削除
1. ヘッダーの利用者情報をクリック。
1. 編集または削除したい車両情報の該当するボタンを押す。（削除時には確認用ポップアップが出るのでOKを押す）

# アプリケーションを作成した背景
このアプリは実際に私の住むマンションをモデルにしている。  
私の家族にヒアリングした結果、マンションの来客用駐車場が使いにくいという課題が共通してあった。  
課題を分析した結果、「管理事務所において紙で管理していること」が根幹にあると仮説を立てた。  
この要因を解決するために「どこでも空き状況を確認でき、そのまま予約・利用申請ができるウェブアプリケーション」を開発することにした。  

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1CPR8qnxEMUm20WKu9gUhCj-ytvj287xLzP_9AdXNzI4/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記載。画像はGyazoで、GIFはGyazoGIFで撮影すること。
## 予約機能
* 予約一覧

* 予約の新規作成

* 予約の削除

## 利用者管理機能
* ログイン／ログアウト機能

* 利用者情報機能

* 編集機能

* 削除機能

## 車輌情報管理機能
* 新規登録機能
* 編集機能
* 削除機能

## 許可証申請機能
* 新規許可証の申請機能
* 申請内容の変更機能
* 許可証の表示機能

# 実装予定の機能
現在は管理者機能を実装中。  
今後はヘルプ機能やキャンセル待ち機能を実装予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/0f9bc7b11183b6b2d43fc02f6913ce3d.png)](https://gyazo.com/0f9bc7b11183b6b2d43fc02f6913ce3d)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/5150d419ff7b7ceff059e1ee31d685a4.png)](https://gyazo.com/5150d419ff7b7ceff059e1ee31d685a4)
# 開発環境
* フロントエンド: HTML, CSS, Javascript  
* バックエンド: Ruby, Ruby on Rails  
* インフラ: MacOS Big Sur(ver.11.7), Github Desktop, Sequel Pro, Heroku
* テスト: Rspec  
* テキストエディタ: Visual Studio Code  
* タスク管理: Github  

# ローカルでの動作方法
ターミナルにて以下のコマンドを順に実行。
% git clone https://github.com/hedgehog248/parking-reserve.git
% cd parking-reserve.git
% bundle install
% yarn install

# 工夫したポイント
今回は私と私の家族が実際に感じている不便を解消したいと考え課題を探しました。
そのため実際の予約の条件や書類の記載事項などは現実のものに則って制約を設けています。
デプロイ後は、実際に家族にも触ってもらいフィードバックをもらって修正を加えるようにしています。  
また高齢者も多く住んでいるため、ウェブサイトに不慣れな人でも迷わないよう意識してデザインしました。
具体的には「ユーザー」を「利用者」とするなどカタカナ語を減らすこと、エラーメッセージを日本語にすること、
ボタンアイコンだけでなく文字でも機能を示すこと、各機能へのアクセスがしやすいことなどです。
