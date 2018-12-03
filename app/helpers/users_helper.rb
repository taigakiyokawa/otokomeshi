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
        posts = Post.where(user_id: user.id)
        posts.each do |post|
          x += post.likes.count
        end
        return x
    end

    def set_shogo_last(user)
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
        elsif posts_count < 13
            new_id = 5
        elsif posts_count < 16
            new_id = 6
        elsif posts_count < 20
            new_id = 7
        elsif posts_count < 24
            new_id = 8
        elsif posts_count < 30
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

    def set_shogo_first2(user)
        posts_count = Post.where(user_id: user.id).count
        nor_list = []

        if 1 < posts_count
            nor_list << 1
            if 4 < posts_count
                list << 2
                if 6 < posts_count
                    nor_list << 3
                    if 9 < posts_count
                        nor_list << 4
                        if 14 < posts_count
                            nor_list << 5
                            if 17 < posts_count
                                nor_list << 6
                                if 21 < posts_count
                                    nor_list << 7
                                    if 25 < posts_count
                                        nor_list << 8
                                        if 34 < posts_count
                                            nor_list << 9
                                            if 39 < posts_count
                                                nor_list << 10
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        
        return nor_list
    end

    def get_likes_total(user)
        x = 0
        posts = Post.where(user_id: user.id)
        posts.each do |post|
          x += post.likes.count
        end
        return x
    end
    
    def set_shogo_last2(user)
        likes_total = get_likes_total(user)

        nor_list = []

        if 1 < posts_count
            nor_list << 1
            if 4 < posts_count
                nor_list << 2
                if 6 < posts_count
                    nor_list << 3
                    if 9 < posts_count
                        nor_list << 4
                        if 12 < posts_count
                            nor_list << 5
                            if 15 < posts_count
                                nor_list << 6
                                if 19 < posts_count
                                    nor_list << 7
                                    if 23 < posts_count
                                        nor_list << 8
                                        if 30 < posts_count
                                            nor_list << 9
                                            if 39 < posts_count
                                                nor_list << 10
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        
        return nor_list
    end

    def get_shogo_ex(user)
        ex_list = []
        tasks = Task.all
        tasks.each do |task|
            if user_posts = task.posts.where(user_id: user.id)
                user_posts.each do |post|
                    if post.likes.find_by(user_id: 1)
                        ex_list << task.id
                        break
                    end
                end
            end
        end
        return ex_list
    end
end
