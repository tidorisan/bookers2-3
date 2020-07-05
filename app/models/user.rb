class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # バリデーション チェック
  # sign in
  validates :name, presence: true,
  					# name 空白　error
  					length: { minimum: 2, maximum: 20 }
  					# 　name 文字数制限 3~20
 #redfile メソット
 attachment :image
end
