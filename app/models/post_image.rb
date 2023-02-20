class PostImage < ApplicationRecord
  has_one_attached :image
  
  #belongs_to は、PostImage モデルから user_id に関連付けられていて、User モデルを参照することができる。
  belongs_to :user
end
