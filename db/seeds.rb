# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    posts = Post.new
    posts.nickname = "류성원"
    posts.password = "123123"
    posts.content = "연습용 페이지라 데이터가 계속 초기화됩니다. 글 남겨주신분들 모두 감사합니다."
    posts.img = "http://c8.ilbe.com/files/attach/new/20130817/14357299/52696821/1812042495/a31efb8e0033390d0cc6050b5a1df41b.jpg"
    posts.like = 0
    posts.save
