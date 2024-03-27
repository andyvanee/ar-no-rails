require './model'

user1 = User.find_or_create_by(name: 'andyvanee')
user2 = User.find_or_create_by(name: 'johndoe')

post1 = Post.find_or_create_by(mirror_id: 1, author_id: user1.id, content: 'Hello world!')
post2 = Post.find_or_create_by(mirror_id: 2, author_id: user2.id, ref_post_id: post1.id, content: 'Retweet!')
post1 = Post.find_or_create_by(mirror_id: 3, author_id: user1.id, ref_post_id: post1.id, content: 'Another Retweet!')
