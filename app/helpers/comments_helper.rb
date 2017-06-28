module CommentsHelper
    def user_is_authorized_for_comment?(comment)
        current_user && (current_user == comment.user || current_user.admin?)
    end

    def any_comments?
        if @user.posts.length == 0
            "#{@user.name} has not submitted any comments yet."
        end
    end
end
