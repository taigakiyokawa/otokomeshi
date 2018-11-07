module ShogosHelper
    def get_likes_total(user)
        x = 0
        @posts = Post.where(user_id: user.id)
        @posts.each do |post|
          x += post.likes.count
        end
        return x
    end

    
end
