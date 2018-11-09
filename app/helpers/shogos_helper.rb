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

        new_name = get_shogo_name(likes_total)

        if now_status = Shogo.where(user_id: user.id).maximum(:status)
            if now_status < likes_total
                @shogo = Shogo.create(user_id: user.id, status: likes_total, shogo_name: new_name)
            end
        else
            @shogo = Shogo.create(user_id: user.id, status: likes_total, shogo_name: new_name)
        end

        return new_name

    end

    def get_shogo_name(status)
        if status < 2
            return  "新参者"
        elsif status < 5
            return "半人前"
        elsif status < 7
            return "できるヤツ"
        elsif status < 10
            return "公次郎"
        else
            return "料理人"
        end
    end
end
