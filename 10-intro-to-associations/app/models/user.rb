class User < ActiveRecord::Base
  has_many :posts
  ## Defines a method called posts that finds all the posts with my user_id

  has_many :comments
  ## Defines a method called comments that finds all the comments with my user_id

  has_many :commented_posts, through: :comments, source: :post
  ## Defines a method called commented_posts that finds all the posts
  ## that I wrote a comment on.

  # attr_reader :cookies

  # def cookies
  #   @cookies
  # end

  # def posts
  #   Post.where(user_id: self.id)
  # end
end
