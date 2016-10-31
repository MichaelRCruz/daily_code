class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :snippet

  # validates_attachment_content_type :snippet, :content_type => ["*/*"]

  do_not_validate_attachment_file_type :snippet
end
