class Book < ApplicationRecord
	belongs_to :user

	#attachment :image # ここを追加（_idは含めない）
	validates :body, length: { in: 1..200 }
	validates :title, length: { minimum:1 }

	def user
    	return User.find_by(id: self.user_id)
	end
end
