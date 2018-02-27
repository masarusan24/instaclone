Ito's Insta Clone
====

本アプリは、[Dive into Code](https://diveintocode.jp/)受講生が最低限Railsを動かせるかを測るお試しアプリです。
Achieveを作り終えることで、これからの学習に必要な事前知識を身に着けることができます。

![my instagram clone 2018-02-28 00-13-34](https://user-images.githubusercontent.com/17737460/36736552-450dde20-1c1c-11e8-8fc7-a395fad875d7.png)

## Description
Achieveを一言で表すと、練習用のInstagramクローンアプリです。
写真を投稿する機能をつけることで、Railsの機能の一端を学ぶことができます。

## Requirement
- Ruby 2.3.1
- Rails 5.1.4
- PostgreSQL 10.1

## Usage
このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。

```
$ git clone git@github.com:masarusan24/instaclone.git
```

次に、以下のコマンドで必要になる Ruby Gems をインストールします。

```
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

これで、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[masarusan24](https://github.com/masarusan24)
