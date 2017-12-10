class Comment < ApplicationRecord
	belongs_to :foto, through: :user
end
