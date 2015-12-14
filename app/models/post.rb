class Post < ActiveRecord::Base
  acts_as_votable

  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :caption, length: { minimum: 2, maximum: 300 }


  has_attached_file :image, styles: { :medium => "640x" }
  # Validate content type
  validates_attachment_content_type :image, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]

end
