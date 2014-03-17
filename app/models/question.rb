class Question < ActiveRecord::Base
	validates :question_title, :question_body, presence: true
	belongs_to :user
end
