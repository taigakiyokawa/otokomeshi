class Task < ApplicationRecord
    has_many :posts

    def self.post_to_this
        post = Post.new(
            title: " ",
            meshim: " ",
            task_id: self.id)
        
    end
end
