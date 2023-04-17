# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "admin@1", password: "123456")

Theme.create!([
    {name: "本当にやりたいことを見つける"},
    {name: "将来のキャリアプラン"},
    {name: "必要なスキル知識を身につける"},
    {name: "人間関係の構築は？"},
    {name: "マネープランを考える"},
    {name: "健康管理をはじめる"},
    {name: "結婚・子育てについて決めておく"},
    {name: "仕事以外に夢中になれるものを持つ"}
    ])