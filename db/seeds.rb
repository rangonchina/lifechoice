# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Admin.create!(email: "admin@1", password: "123456",password_confirmation: "123456")

Theme.create!([
    {name: "本当にやりたいことを見つける", image_id: 1},
    {name: "将来のキャリアプラン", image_id: 2},
    {name: "必要なスキル知識を身につける", image_id: 3},
    {name: "人間関係の構築は？", image_id: 4},
    {name: "マネープランを考える", image_id: 5},
    {name: "健康管理をはじめる", image_id: 6},
    {name: "結婚・子育てについて決めておく", image_id: 7},
    {name: "仕事以外に夢中になれるものを持つ", image_id: 8}
    ])
    
# # Goal.create!([
#     {status: "すでに決まっている"},
#     {status: "まだ考えている"},
#     {status: "何も考えていない"},
#     {status: "すでに達成した"}
    # ])