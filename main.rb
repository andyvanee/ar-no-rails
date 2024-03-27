require './model'

puts "--- Post.all.preload ---"
Post.all.preload(:ref_post).each do |post|
    puts post.ref_post && post.ref_post.attributes
end

puts "--- Post.all.includes ---"
Post.all.includes(:ref_post).each do |post|
    puts post.ref_post && post.ref_post.attributes
end

puts "--- Post.all.eager_load ---"
Post.all.eager_load(:ref_post).each do |post|
    puts post.ref_post && post.ref_post.attributes
end
