# アプリケーション名
ABCマンション(仮)来客用駐車場予約アプリ『トットコ！』  


# アプリケーション概要
マンションの来客用駐車場の予約管理と利用申請、利用許可証の発行ができるウェブアプリケーション。  


# URL
http://54.92.30.85/


# テスト用アカウント
<table>
  <tr>
    <td>Basic認証ID</td>
    <td>admin</td>
  </tr>
  <tr>
    <td>Basic認証パスワード</td>
    <td>9900</td>
  </tr>
  <tr>
    <td>利用者メールアドレス</td>
    <td>test@user</td>
  </tr>
  <tr>
    <td>利用者パスワード</td>
    <td>test1234</td>
  </tr>
  <tr>
    <td>管理者メールアドレス</td>
    <td>admin@user</td>
  </tr>
  <tr>
    <td>管理者パスワード</td>
    <td>admin1234</td>
  </tr>
</table>
  

# 予約の条件・仕様
- 駐車場は4台分
- 1回の予約で1時間〜最大24時間、1時間単位
- 予約可能期間は翌月末まで（ex. 今日が7月1日〜31日ならば8月31日までの予約が可能）
- 1つのアカウントにつき、同時に3つまで予約可能
  
# 利用方法
## 空き状況の確認・新規予約
1. ログインまたは利用者新規登録を行う。
1. ヘッダーの予約表から確認したい日付をクリックすると、その日の空き状況がタイムテーブルで表示される。
1. 新規予約の場合は、タイムテーブル上の開始希望時間枠をクリック。
1. 予約画面で終了日時を選択し「確認画面へ」ボタンを押す。
1. 予約可能な場合は確認画面になるので確定ボタンを押す。

## 利用許可証の申請
1. 予約後、トップページへ移動する。
1. 申請したい予約にある許可証の申請ボタンを押し、必要事項を入力のうえ申請ボタンを押す。

## 利用許可証の表示・印刷
1. 利用許可証の申請後、トップページへ移動する。
1. 該当する予約リストにある利用許可証の表示・印刷ボタンを押す。
1. ダウンロードまたは印刷が可能。

## よく利用する車両情報の事前登録
1. ヘッダーの利用者情報をクリック。
1. 車両情報の新規登録ボタンを押し、必要事項を入力のうえ登録ボタンを押す。  
(利用許可証の申請時に登録した車両情報が自動入力の選択肢として表示される）

## 【管理者機能】予約一覧
1. ログイン画面から管理者用メールアドレスとパスワードでログイン後、ヘッダーの予約一覧をクリック。
1. 全ての予約が一覧で表示される。また許可証申請済みの場合は右端のボタンで申請内容の確認が可能。ヘッダーをクリックしてソートできる。

## 【管理者機能】退去した利用者の削除
1. ログイン画面から管理者用メールアドレスとパスワードでログイン後、ヘッダーの利用者一覧をクリック。
1. 登録済みの全利用者（管理者を除く）が表示される。右端のボタンで強制削除が可能。

# アプリケーションを作成した背景
このアプリは実際に私の住むマンションをモデルにしている。  
私の家族にヒアリングした結果、マンションの来客用駐車場が使いにくいという課題が共通してあった。  
課題を分析した結果、「管理事務所において紙で管理していること」が根幹にあると仮説を立てた。  
この要因を解決するために「どこでも空き状況を確認でき、そのまま予約・利用申請ができるウェブアプリケーション」を開発することにした。  

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1CPR8qnxEMUm20WKu9gUhCj-ytvj287xLzP_9AdXNzI4/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明
## 予約機能
* 予約一覧画面(トップページ)
[![Image from Gyazo](https://i.gyazo.com/e4a90747d5986a2250d52ec46d00ef58.png)](https://gyazo.com/e4a90747d5986a2250d52ec46d00ef58)
* 予約の新規作成  
1. カレンダーで日にちを選択、タイムテーブルで開始時間を選択
[![Image from Gyazo](https://i.gyazo.com/43345f1a23cb59087769c76ee853fe52.gif)](https://gyazo.com/43345f1a23cb59087769c76ee853fe52)
1. 予約情報を入力し、確認画面ののち、完了画面へ  
[![Image from Gyazo](https://i.gyazo.com/70279674abdede1b1d88a6b02c6be825.gif)](https://gyazo.com/70279674abdede1b1d88a6b02c6be825)
* 予約の削除
[![Image from Gyazo](https://i.gyazo.com/7ad1d999da1bed6c86951017239323bb.gif)](https://gyazo.com/7ad1d999da1bed6c86951017239323bb)
## 利用者管理機能
* 新規登録
[![Image from Gyazo](https://i.gyazo.com/fd89859fa3663191faecfd52d6d7ef04.gif)](https://gyazo.com/fd89859fa3663191faecfd52d6d7ef04)
* ログイン機能
[![Image from Gyazo](https://i.gyazo.com/09b1065b9dec8b3fbb6e48f4ade6f534.gif)](https://gyazo.com/09b1065b9dec8b3fbb6e48f4ade6f534)
* ログアウト機能
[![Image from Gyazo](https://i.gyazo.com/a26a976e4e63fc17dc412973744a2b3c.gif)](https://gyazo.com/a26a976e4e63fc17dc412973744a2b3c)
* 利用者情報画面
[![Image from Gyazo](https://i.gyazo.com/09655e35859b3915f3d7ca51a9717295.png)](https://gyazo.com/09655e35859b3915f3d7ca51a9717295)
* 編集機能
[![Image from Gyazo](https://i.gyazo.com/841bbf70d2b1f98cffef44e9196170e2.gif)](https://gyazo.com/841bbf70d2b1f98cffef44e9196170e2)
* 削除機能
[![Image from Gyazo](https://i.gyazo.com/888b42cb36ada5af94b27100976b8ec6.gif)](https://gyazo.com/888b42cb36ada5af94b27100976b8ec6)

## 車両情報管理機能
* 新規登録機能
[![Image from Gyazo](https://i.gyazo.com/3476827494ed5a039e8a909c53725ee5.gif)](https://gyazo.com/3476827494ed5a039e8a909c53725ee5)
* 編集機能
[![Image from Gyazo](https://i.gyazo.com/d80f5c83f48eaf3be11405169a5ac84d.gif)](https://gyazo.com/d80f5c83f48eaf3be11405169a5ac84d)
* 削除機能
[![Image from Gyazo](https://i.gyazo.com/f67866311975669effc27ed5fa56c6d7.gif)](https://gyazo.com/f67866311975669effc27ed5fa56c6d7)
## 許可証申請機能
* 新規許可証の申請機能  
  車両登録をしている場合はセレクトボックスに表示され、自動入力される
[![Image from Gyazo](https://i.gyazo.com/dc392ae12db482536b44ad2d58ff781c.gif)](https://gyazo.com/dc392ae12db482536b44ad2d58ff781c)
* 許可証の表示機能
[![Image from Gyazo](https://i.gyazo.com/ace181a66dd028d720334dc0f8cfc755.gif)](https://gyazo.com/ace181a66dd028d720334dc0f8cfc755)
* 申請内容の変更機能
[![Image from Gyazo](https://i.gyazo.com/af09830acf01d8e2bf5990d733b49534.gif)](https://gyazo.com/af09830acf01d8e2bf5990d733b49534)

## 管理者機能
* 予約一覧機能（ソート機能あり）
[![Image from Gyazo](https://i.gyazo.com/e81ee807329cd5c4c4e2ac0be1a05daf.gif)](https://gyazo.com/e81ee807329cd5c4c4e2ac0be1a05daf)
* 利用者一覧機能（ソート機能あり）
[![Image from Gyazo](https://i.gyazo.com/0b6cc3f7a25d9eb9f6dcf16b00bb1315.gif)](https://gyazo.com/0b6cc3f7a25d9eb9f6dcf16b00bb1315)

## レスポンシブデザイン
* スマートフォン、タブレット、PCの3段階で実装
[![Image from Gyazo](https://i.gyazo.com/48d0cf033a9e4097249bcfa85e8bf7ae.gif)](https://gyazo.com/48d0cf033a9e4097249bcfa85e8bf7ae)

# 実装予定の機能
今後はヘルプ機能やキャンセル待ち機能を実装予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/d337a62e1b56904f567a8bd349d38237.png)](https://gyazo.com/d337a62e1b56904f567a8bd349d38237)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/5150d419ff7b7ceff059e1ee31d685a4.png)](https://gyazo.com/5150d419ff7b7ceff059e1ee31d685a4)
# 開発環境
* フロントエンド: HTML, CSS, Javascript  
* バックエンド: Ruby, Ruby on Rails  
* インフラ: MacOS Big Sur(ver.11.7), Github Desktop, Sequel Pro, Heroku, AWS
* テスト: Rspec  
* テキストエディタ: Visual Studio Code  
* タスク管理: Github  

# ローカルでの動作方法
ターミナルにて以下のコマンドを順に実行。  
```
% git clone https://github.com/hedgehog248/parking-reserve.git  
% cd parking-reserve.git  
% bundle install  
% yarn install  
```
# 工夫したポイント
今回は私と私の家族が実際に感じている不便を解消したいと考え課題を設定した。  
そのため実際の予約の条件や書類の記載事項などは、現実のものに則って制約を設けている。  
デプロイ後は実際に家族にも触ってもらい、そのフィードバックをもとに修正を加えている。   
また高齢者が多く住んでいるため、ウェブサイトに不慣れな人でも迷わないデザインを心がけた。  
具体的には「ユーザー」を「利用者」とするなどカタカナ語を減らすこと、エラーメッセージを日本語にすること、
ボタンアイコンだけでなく文字でも機能を示すことなどである。  
