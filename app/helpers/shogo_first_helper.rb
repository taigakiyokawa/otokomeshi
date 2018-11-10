module ShogoFirstHelper

    def show_shogo_first(user)
        posts_total = Post.where(user_id: user.id).count

        new_first_name = get_shogo_first_name(posts_total)

        if now_status = ShogoFirst.where(user_id: user.id).maximum(:status)
            if now_status < posts_total
                @shogo_first = ShogoFirst.create(user_id: user.id, status: posts_total, shogo_first_name: new_first_name)
            end
        else
            @shogo_first = ShogoFirst.create(user_id: user.id, status: posts_total, shogo_first_name: new_first_name)
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
