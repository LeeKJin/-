class QuestionId < ActiveRecord::Base
    belongs_to :user
    paginates_per 5
end
