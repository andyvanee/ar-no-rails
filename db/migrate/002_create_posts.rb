
class CreatePosts < ActiveRecord::Migration[7.1]
    def change
        create_table :posts do |t|
            t.integer :mirror_id

            t.integer :author_id, index: { unique: false }
            t.integer :ref_post_id, index: { unique: false }
            t.text :content

            t.timestamps
        end        
    end
end
