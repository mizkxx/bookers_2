class Book < ApplicationRecord
	belongs_to :user

	attachment :image # ここを追加（_idは含めない）


	def user
    	return User.find_by(id: self.user_id)
	end
end
