class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         #1:Nの1側が削除されたとき、N側を全て削除するという意味。ここではUserが削除された時に、そのUserが投稿したPostImageが全て削除されるとなる。
         #has_many = たくさん持っているという意味。
         has_many :post_images, dependent: :destroy
end
