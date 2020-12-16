class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}


    def total_likes
        likes_array = self.posts.map {|post| post.likes}.compact
        likes_array.sum
    end

    def featured_post
        likes_array = self.posts.map {|post| post.likes}.compact
        featured_array = self.posts.select {|post| post.likes == likes_array.max}
        featured_array[0]
    end
    
end
