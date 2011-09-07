class Category < ActiveRecord::Base
  has_many :articles

  validates :name, :presence => true

  def editable_by?(user)
   user.present? and and user.admin?
  end

  def deletable_by?(user)
   user.present? and user.admin?
  end
end
