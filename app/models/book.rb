class Book < ApplicationRecord
	# モデル関連づけ
	belongs_to :user
	# バリデーション チェック
	#  book
	validates :title, presence: true,
	 				length: { maximum: 200 }
	validates :body, presence: true,
	 				length: { maximum: 200 }
end
