
# "Minkatsu"
## -みんなで便利な商品を活用しよう-
## サイト概要
### サイトテーマ
皆さんのお気に入りアイテムの使い方をみんなで共有して商品を有効活用しよう！
誰でも情報共有ができるSNS形式のサイトです。
​
### テーマを選んだ理由
世の中便利グッズが多くあります。使い方も多様です。
せっかく買ったグッズを有効活用したい、他の人はどのように使っているか知りたいと思うことが多々あり、
使い方をみんなで共有するサイトがあるといいなと思いこのテーマを選びました。

### ターゲットユーザ
- 買ったけれども有効活用法が分からない人
- まだ持っていないけれど、実際どのように使えるか知りたい人

### 主な利用シーン
- 商品を買って使い方を知りたいとき
- 商品が気になっていて事前に調べたいとき

### 想定
架空の生活雑貨を取り扱う会社が、ECサイトとは別に作成した、
架空の商品の活用方法を共有していくサイトです。
​
## 設計書
- ER図
  ![SNS_ER図 drawio](https://github.com/user-attachments/assets/950b614c-eba3-48ff-979c-f283686ebf90)

- 画面遷移図
  ![ポートフォリオ制作_UIFlows_ drawio](https://github.com/user-attachments/assets/f6654576-888e-4a1e-b401-1ccf9ab65490)  


- アプリケーション詳細設計:(https://docs.google.com/spreadsheets/d/1c7y2gMjikHUbAWBlEJT8U8jZn-dryq8msB4_TSfF4wc/edit?usp=sharing)
- テーブル定義書:(https://docs.google.com/spreadsheets/d/1iCeHmS1Pz1KJW8GqEMR2qjZwD_xMrSX3eG2HNu7w5Bg/edit?usp=sharing)

## 実装した機能

### 会員側
|機能名|説明|非ログイン時利用可否|
|------|----|--------------------|
|ログイン機能|・メールアドレス、パスワードでログインできる。<br>・ログイン時のみ利用できる機能が利用可能になる。|○|
|ログアウト機能|・ログインしている状態からログアウト状態にする<br> ・ログイン時のみ利用できる機能が利用できなくなる。|×|
|投稿一覧|・投稿を一覧表示する。<br>・ジャンルによる絞り込み機能を利用する場合は、検索条件に当てはまる投稿のみ一覧表示する。<br>・並び替え機能で、古い順、新しい順に並び替えすることができます。|×︎|
|投稿詳細表示機能|・投稿一覧画面で選択した詳細情報を表示する。<br>・いいね機能、コメントができる。<br>・自身の投稿の場合、編集・削除ボタンが出現。|×︎︎|
|新規投稿|・投稿ができる。
|投稿編集機能|・投稿を編集・削除することができる。|×︎|
|ユーザー詳細表示機能|・投稿詳細画面で選択した詳細情報を表示する。|×|
|いいね機能|・投稿にいいねまたはいいねの解除をすることができる。|×|
|いいね一覧|・自分がいいねした投稿を表示することができる。|×|
|コメント機能|・投稿に対してコメント、コメント削除することができる。|×|
|フォロー,フォロワー機能|・他のユーザー詳細画面、フォロー、フォロワー一覧ページでフォローまたは解除することができる。<br>・フォロー、フォロワー一覧ページでフォローまたは解除することができる。|×|
|フォロー,フォロワー一覧|・フォロー、フォロワーを押すことで一覧表示することができる。|×|
|通知機能|・自身の投稿にいいねされたとき、フォローされたときに通知が通知一覧に表示される。|×|
|通知一覧|・通知一覧で確認したものは既読済みに切り替わる。|×|
|検索機能|・ユーザー、投稿の検索ができる。|×|
|退会機能|・退会手続きをすることができる。|×|
|ユーザー編集機能|・登録している情報を変更する事ができる。|×|

### ゲストログイン時
ゲストログインは、閲覧の目的で用意した機能なので、通常ログイン時と比べ制限があります。
|機能名|説明|
|------|----|
|ログイン機能|・メールアドレス、パスワードを設定せずログインできる。|
|ログアウト機能|・ログインしている状態からログアウト状態にする。|
|会員情報編集機能|・会員情報ができないようにボタンを非表示にしています。|
|新規投稿|・新規投稿ボタンを押すとフラッシュメッセージがでて、新規投稿ができなくなる。|
|フォロー,フォロワー機能|・他のユーザー詳細画面、フォロー、フォロワー一覧ページでフォローを押すとmypageにリダイレクトします。<br>・フォロー、フォロワー一覧ページでフォローを押すとmypageにリダイレクトします。|
|いいね機能|・いいねを押すとmypageにリダイレクトされます。|
|いいね一覧|・いいね一覧を押すとmypageにリダイレクトされます。|

### 管理者側
|機能名|説明|非ログイン時利用可否|
|------|----|--------------------|
|ログイン機能|・メールアドレス、パスワードでログインできる。<br>・ログイン時のみ利用できる機能が利用できるようになる。|×|
|ログアウト機能|・ログインしている状態からログアウト状態にする。<br>・ログイン時のみ利用できる機能が利用できなくなる。|×|
|会員一覧表示機能|・会員情報を一覧で確認することができる。|×|
|会員詳細情報表示機能|・会員の詳細情報を確認することができる。<br>・会員のステータス（有効/退会）を切り替えることができる。|×|
|投稿一覧|・投稿の一覧表示。|×|
|投稿詳細表示機能|・投稿一覧画面で選択した詳細情報を表示する。<br>・不適切な投稿は削除することができる。|×︎︎|
|コメント一覧|・投稿コメントの一覧表示。|×|
|コメント詳細|・投稿コメントの投稿元への遷移ボタン、不適切なコメントの削除ができる。|×|
|ジャンル一覧|・ジャンルの一覧表示。ジャンルの新規追加、削除ができる。|×|
|検索機能|・ユーザー、投稿、コメントの検索ができる。|×|
|ジャンル編集|・ジャンルの編集ができる。|×|

## 開発環境
- OS：Linux(Amazon Linux 2)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
- API：Google Natural Language API
​
## 使用素材
- PAKUTASO
  (https://www.pakutaso.com/20230820229oneroom84s.html#google_vignette)
- photoAC
  (https://www.photo-ac.com/main/detail/3482649?title=%E3%82%BF%E3%82%AA%E3%83%AB%E3%82%92%E5%8F%8E%E7%B4%8D%E3%81%99%E3%82%8B)
  (https://www.photo-ac.com/main/detail/2709497&title=%E5%8F%8E%E7%B4%8D%E3%83%9C%E3%83%83%E3%82%AF%E3%82%B9#goog_rewarded)
  (https://www.photo-ac.com/main/detail/29445444&title=%E9%9D%B4%E7%A3%A8%E3%81%8D%E3%81%AE%E3%82%BB%E3%83%83%E3%83%88+%E9%9D%A9%E9%9D%B4)
