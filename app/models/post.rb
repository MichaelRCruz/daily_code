class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :snippet
  has_many :comments, dependent: :destroy

  # validates_attachment_content_type :snippet, :content_type => ["*/*"]

  do_not_validate_attachment_file_type :snippet
end
