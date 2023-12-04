# Cycling Life
スマホなどで撮影した画像を投稿できるアプリです。  
撮影した画像を他のユーザーと共有することができます。  
撮影した場所の住所を入力することで、Gogle Mapを表示することもできます。  

# 開発経緯
以前のコロナ感染拡大時に人との密状態を避けるため、通勤通学の手段として自転車の利用が推奨された時期がありました。
その後感染は縮小傾向になりましたが、中にはそれをきっかけに趣味・あるいは健康のために継続して自転車を日常的に利用する人もいるでしょう。
そんな人達のために行く先々でのお気に入りの場所を共有できるサイトがあれば良いと思い、このアプリを開発しました。  
このアプリを通じて、自転車に乗ることの楽しさをより深めてもらえるといいなと思います。

# URL
 https://cyclinglife-e347f543e037.herokuapp.com　  
画面上部右のタブからユーザー登録をすることなくゲストユーザーとしてログインできます。
 
# 使用技術

  * HTML  
  * CSS  
  * JavaScript  
  * Bootstrap5  
  * Ruby 3.0.6  
  * Ruby on rails 7.0.8  
  * PostgreSLQ  
  * Heroku  
  * AWS S3  
  * Rspec
  * Google maps API

# 構成図
 
![railsApp.drawio.png](./railsApp.drawio.png)
 
# ER図
 ![er_diagram.png](./er_diagram.png)
 
# 機能一覧

 | 機能 | 説明 |
----|---- 
| ユーザー登録 | ユーザー名・アバター画像・プロフィール文の設定ができます。　|
| ログイン機能(devise) | メールアドレス・パスワードの入力でログインできます。 |
| ゲストログイン | ユーザー登録をせずにアプリ内の機能を試用することができます。 |
| 投稿機能 | ファイルから画像を選択し、アップロードできます。  また、任意で住所を入力すると詳細画面にGooglemapを表示させることができます。|
| コメント機能 | 投稿に対してコメントすることができます。|
| いいね機能 | 気に入った投稿に対していいねボタンを押すことができます。 |
| 検索機能 | 撮影場所名についてフリーワード検索をすることができます。 |
| レスポンシブ対応 | 画面のサイズに合わせて表示します。 |
# 


 
# Author
 
作成情報を列挙する
 
* 作成者
* 所属
* E-mail
 
# 
