class Post < ActiveRecord::Base
    has_many :comment
    belongs_to :user
    paginates_per 5
    resourcify
end
