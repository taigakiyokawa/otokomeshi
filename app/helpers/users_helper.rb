module UsersHelper
    def set_shogo_first(user)
        post_count = Post.where(user_id: user.id).count

        if user.shogo_first_id < post_count
            if post_count < 2
                return 1
            elsif post_count < 5
                return 2
            elsif post_count < 7
                return 3
            elsif post_count < 10
                return 4
            elsif post_count < 15
                return 5
            elsif post_count < 18
                return 6
            elsif post_count < 22
                return 7
            elsif post_count < 26
                return 8
            elsif post_count < 35
                return 9
            else
                return 10
            end
        else
            return user.shogo_first_id
        end
    end   
end