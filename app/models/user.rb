class User < ApplicationRecord
  has_many :study_times, dependent: :destroy

  # 認証ハッシュからユーザーを検索し、存在しない場合は新しく作成
  def self.find_or_create_from_auth_hash(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.update(
      name: auth_hash['info']['name'],
      image_url: auth_hash['info']['image'],
      token: auth_hash['credentials']['token'],
      secret: auth_hash['credentials']['secret']
    )
    user
  end  
end
