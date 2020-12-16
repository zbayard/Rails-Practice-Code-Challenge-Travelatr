class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def last_five_posts
        self.posts.last(5)
    end

    def featured_destination
        likes_array = self.posts.map {|post| post.likes}.compact
        featured = self.posts.select {|post| post.likes == likes_array.max}
        featured[0]
    end

    def avg_age
        ages_of_bloggers = self.bloggers.map {|blogger| blogger.age}
        ages_of_bloggers.sum / ages_of_bloggers.count
    end


end
