class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "100x100>" }
  default_scope order("created_at DESC")

  

  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']
  validates :title, :presence => true, :uniqueness => true, :length => { :minimum => 3, :maximum => 40 }
  validates :body, :presence => true, :uniqueness => true, :length => { :minimum => 40, :maximum => 1000 }
  validates :category, :presence => true
  validates :user, :presence => true
  
  def visible_to?(user)
    true
  end

  def editable_by?(user)
    user.present? and (self.user == user or user.admin?)
  end

  def deletable_by?(user)
    user.present? and (self.user == user or user.admin?)
  end
end
