class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # バリデーション チェック
  # user name
  validates :name, presence: true,
  					# name 空白　error
  					length: { minimum: 2, maximum: 20 }
  					# 　name 文字数制限 2~20
  #user introduction
  validates :introduction, length: { maximum: 50 }
  # バリデーション チェックここまで
  #redfile メソット
  attachment :profile_image
  # モデル関連づけ
  has_many :books, dependent: :destroy
end