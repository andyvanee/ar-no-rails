require 'active_record'
require './db/db'

class User < ActiveRecord::Base
    has_many :posts
end

class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :ref_post, class_name: 'Post', foreign_key: 'ref_post_id'
end
