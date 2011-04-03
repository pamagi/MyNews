class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :user, :presence => true
  validates :article, :presence => true

  def visible_to?(user)
    true
  end

  def deletable_by?(user)
    user.present? and user.admin?
  end
end
