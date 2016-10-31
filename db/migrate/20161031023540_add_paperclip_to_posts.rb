class AddPaperclipToPosts < ActiveRecord::Migration[5.0]
  def change
    add_attachment :posts, :snippet
  end
end
