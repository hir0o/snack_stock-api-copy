# README

![Rails](https://github.com/NeiiT-inc/snack-stock/workflows/Rails/badge.svg)

## 環境構築

* Ruby 2.7.1
* Redis 6.0.9

### リポジトリのクローン

```shell
$ git clone https://github.com/NeiiT-inc/snack-stock.git
$ bundle install
```
### DBの作成

.envの編集

環境に合わせて
MYSQL_USER と MYSQL_PASSWORD

```shell
$ bundle exec rails db:create
```
## サーバの起動

- rails server
- webpacak-dev-server

```shell
$ bundle exec foreman start
```

### rubocopの実行

```shell
% bundle exec rubocop
```

### RSpecの実行

```shell
% bundle exec rspec
```

