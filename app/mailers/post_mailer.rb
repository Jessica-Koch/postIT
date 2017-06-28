class PostMailer < ApplicationMailer
    def new_post(post)
        headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"

        @post = post
        mail(to: post.user.email, subject: "You're following #{post.title}")

    end
        def new_post(post)
        headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"

        @post = post
        mail(to: post.user.email, subject: "You're following #{post.title}")

    end
end
