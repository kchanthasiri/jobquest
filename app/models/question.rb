class Question < ActiveRecord::Base
	validates :question_title, :question_body, presence: true
	
	# Allows Tagging on questions for companies and careers
	acts_as_taggable
	acts_as_taggable_on :companies, :careers
	
	belongs_to :user
	has_many :comments


	def self.search_for(query)
  	# Need to put Self because this attaches the method to all of the models instead of one individual model
  	where('question_title LIKE :query OR question_body LIKE :query', query: "%#{query}%")
  	end


end
