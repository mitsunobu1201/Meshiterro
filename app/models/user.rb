class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #1:Nの1側が削除されたとき、N側を全て削除するという意味。ここではUserが削除された時に、そのUserが投稿したPostImageが全て削除されるとなる。
  #has_many = たくさん持っているという意味。
  has_many :post_images, dependent: :destroy
  
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
