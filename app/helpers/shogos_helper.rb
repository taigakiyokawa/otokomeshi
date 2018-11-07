module ShogosHelper
    def get_likes_total(user)
        x = 0
        @posts = Post.where(user_id: user.id)
        @posts.each do |post|
          x += post.likes.count
        end
        return x
    end

    def show_shogo(user)
        likes_total = get_likes_total(user)
        if shogo = user.shogos.find_by(user_id: user.id)
            if not shogo.status == likes_total
                @shogo = Shogo.update user_id: user.id, status: likes_total
            end
        else
            @shogo = Shogo.create user_id: user.id, status: likes_total
        end
        return likes_total
    end
end
