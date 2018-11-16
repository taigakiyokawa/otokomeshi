module UsersHelper

    def set_shogo_first(user)
        posts_count = Post.where(user_id: user.id).count

        new_id = 1

        if posts_count < 2
            new_id =  1
        elsif posts_count < 5
            new_id = 2
        elsif posts_count < 7
            new_id = 3
        elsif posts_count < 10
            new_id = 4
        elsif posts_count < 15
            new_id = 5
        elsif posts_count < 18
            new_id = 6
        elsif posts_count < 22
            new_id = 7
        elsif posts_count < 26
            new_id = 8
        elsif posts_count < 35
            new_id = 9
        else
            new_id =10
        end
        
        if user.shogo_first_id < new_id
            return new_id
        else
            return user.shogo_first_id
        end
    end

    def get_likes_total(user)
        x = 0
        @posts = Post.where(user_id: user.id)
        @posts.each do |post|
          x += post.likes.count
        end
        return x
    end
    
    def set_shogo_last(user)
        likes_total = get_likes_total(user)

        new_id = 1

        if likes_total < 2
            new_id =  1
        elsif likes_total < 5
            new_id = 2
        elsif likes_total < 7
            new_id = 3
        elsif likes_total < 10
            new_id = 4
        elsif likes_total < 13
            new_id = 5
        elsif likes_total < 16
            new_id = 6
        elsif likes_total < 20
            new_id = 7
        elsif likes_total < 24
            new_id = 8
        elsif likes_total < 30
            new_id = 9
        else
            new_id =10
        end

        if user.shogo_last_id < new_id
            return new_id
        else
            return user.shogo_last_id
        end
    end   
end