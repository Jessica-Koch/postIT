module UsersHelper
    def any_posts?
        if @user.posts.length == 0
            "#{@user.name} has not submitted any posts yet."
        end
    end
end
