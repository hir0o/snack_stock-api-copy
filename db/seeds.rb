# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 都道府県Seed
p 'prefectures...'
require './db/seeds/00_prefectures'
p '...ok'

# お菓子の種類
p 'genres...'
require './db/seeds/01_genres'
p '...ok'

# ユーザー
p 'users...'
require './db/seeds/02_users'
p '...ok'

# 投稿
p 'posts...'
require './db/seeds/03_posts'
p '...ok'
