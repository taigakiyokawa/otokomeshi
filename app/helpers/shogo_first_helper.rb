module ShogoFirstHelper
    def get_likes_total(user)
        x = 0
        @posts = Post.where(user_id: user.id)
        @posts.each do |post|
          x += post.likes.count
        end
        return x
    end

    def show_shogo_first(user)
        likes_total = get_likes_total(user)

        new_first_name = get_shogo_first_name(likes_total)

        if now_status = ShogoFirst.where(user_id: user.id).maximum(:status)
            if now_status < likes_total
                @shogo_first = ShogoFirst.create(user_id: user.id, status: likes_total, shogo_first_name: new_first_name)
            end
        else
            @shogo_first = ShogoFirst.create(user_id: user.id, status: likes_total, shogo_first_name: new_first_name)
        end

        return new_first_name

    end

    def get_shogo_first_name(status)
        if status < 2
            return  "未熟な"
        elsif status < 5
            return "駆け出しの"
        elsif status < 7
            return "そこそこ"
        elsif status < 10
            return "とんとこ"
        else
            return "名の知れた"
        end
    end
end
