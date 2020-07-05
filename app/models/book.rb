class Book < ApplicationRecord
	# モデル関連づけ
	belongs_to :user
end
