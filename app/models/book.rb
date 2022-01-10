class Book < ApplicationRecord
	belongs_to :user
	has_many :bookcomments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def self.looks(search, word)
		if search  == "perfect_match"
			@book = Book.where("title LIKE?","#{word}")
		elsif search == "forword_match"
    	@book = Book.where("title LIKE?","#{word}")
		elsif search == "backward_match"
			@book = Book.where("title LIKE?","%#{word}")
		elsif search == "partial_match"
			@book = Book.where("title LIKE?","%#{word}")
		else
			@book = Book.all
		end
	end



	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

end
