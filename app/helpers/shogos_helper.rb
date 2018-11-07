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

    def show_shogo_2(user)
        likes_total = get_likes_total(user)

        if shogo = user.shogos.find_by(user_id: user.id)
            if not shogo.status == likes_total
                @shogo = Shogo.update(user_id: user.id, status: likes_total)
            end
        else
            @shogo = Shogo.create(user_id: user.id, status: likes_total)
        end

        if likes_total < 1
            return "見習い"
        elsif likes_total < 2
            return "新参者"
        elsif likes_total < 3
            return "中級者"
        else
            return "横綱"
        end
    end

    def get_shogo_name(shogo)
        if shogo.status < 2
            shogo.shogo_name = "新参者"
        elsif shogo.status < 5
            shogo.shogo_name = "半人前"
        elsif shogo.status < 7
            shogo.shogo_name = "できるヤツ"
        elsif shogo.status < 10
            shogo.shogo_name = "公次郎"
        else
            shogo.shogo_name = "料理人"
        end
        
end
